<?php
include 'functions.php';
$phrases=array(
    'use',
    'select',
    'show',
    'set',
);

$host='localhost';
$user=get_current_user();
$password='';
$type='mysql';
for($i=1;$i<sizeof($argv);$i++)
{
    if(substr($argv[$i],0,2)=='--')
    {
        switch(substr($argv[$i],2))
        {
        case 'mysql': $type='mysql';break;
        case 'mssql': $type='mssql';break;
        }
    }
    else
    {
        if(substr($argv[$i],0,1)=='-' )
        {
            if(isset($argv[$i+1]))
            {
                switch(substr($argv[$i],1))
                {
                case 'h': $host=$argv[$i+1];break;
                case 'u': $user=$argv[$i+1];break;
                case 'p': $password=$argv[$i+1];break;
                }
            }
            if(!isset($argv[$i+1]))
            {
                switch(substr($argv[$i],1))
                {
                case 'p': $password=readline('Password : ');
                }
            }
        }
    }
}
$cons='mysql';
$dbase='';
function databaseConnect()
{
    mysql_connect('localhost','root');
    mysql_query("set names utf8");
}
    $quer=mysql_query('show databases');
while($query=mysql_fetch_array($quer))
{
    $phrases[]=$query[0];
    $quer1=mysql_query('show tables in '.$query[0]);
    while($query1=mysql_fetch_array($quer1))
    {
        $phrases[]=$query1[0];
        $phrases[]=$query[0].'.'.$query1[0];
    }

}
readline_read_history('history');
readline_completion_function(function($input,$index){
    global $phrases;
    $matches=array();
    foreach($phrases as $phrase)
    {
         if(stripos($phrase, $input) === 0)
             $matches[] = $phrase;
    }
    if(sizeof($matches)>0)
        return $matches;
    if($input=='')
        return array("");
});
while(true)
{
    $val = readline($cons.">");
    if (!empty($val)) {
        readline_add_history($val);
    }
    $table=runQuery($val);
    if(sizeof($table)>0)
    {
        echo outTable($table)."\n";
    }
    readline_write_history('history');
    $history=explode("\n",file_get_contents('history'));
    $newHistory=array();
    $keys=array();
    for($i=sizeof($history)-1;$i>=0;$i--)
    {
        if(!isset($keys[$history[$i]]))
        {
            $keys[$history[$i]]=1;
            $newHistory[]=$history[$i];
        }
    }
    file_put_contents('history',implode("\n",array_reverse($newHistory)));
    readline_read_history('history');
}

?>
