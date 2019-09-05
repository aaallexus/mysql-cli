<?php
include 'functions.php';
$phrases=array(
    'use',
    'select',
    'show',
    'set',
);
$executeScript='';
$host='localhost';
$user=get_current_user();
$password='';
$database='';
$typeDB='mysql';
$vimOut=false;
$maxWidth=140;
$options=getopt("h:u:p:d:s:",array("mysql","mssql","vim",'max-width:','screen-width:'));
{
    foreach($options as $arg=>$value)
    {
        switch($arg)
        {
            case 'h': $host=$value;break;
            case 'u': $user=$value;break;
            case 'p': $password=$value;break;
            case 'd': $database=$value;break;
            case 's': $executeScript=$value;break;
            case 'mysql': $typeDB='mysql';break;
            case 'mssql': $typeDB='mssql';break;
            case 'vim' : $vimOut=true;break;
            case 'screen-width' :
            case 'max-width': $maxWidth=$value;break;
        }
    }
}
/*for($i=1;$i<sizeof($argv);$i++)
{
    if(substr($argv[$i],0,2)=='--')
    {
        switch(substr($argv[$i],2))
        {
        case 'mysql': $typeDB='mysql';break;
        case 'mssql': $typeDB='mssql';break;
        case 'vim' : $vimOut=true;break;
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
                case 'd': $database=$argv[$i+1];break;
                case 's': $executeScript=$argv[$i+1];break;
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
}*/
$cons='mysql';
function databaseConnect($typeDB,$host,$user,$password,$database='')
{
    $pdo='';
    switch($typeDB)
    {
    case 'mysql':
        $pdo = new PDO(
            'mysql:host='.$host.';dbname='.$database.';charset=utf8',
             $user,
             $password
        );
        break;
    case 'mssql':
        $pdo = new PDO(
            'dblib:host='.$host.';dbname='.$database,
             $user,
             $password
        );
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        break;
    }
    return $pdo;
}
$pdo=databaseConnect($typeDB,$host,$user,$password,$database);
function getKeywords($pdo,$typeDB){
    global $database;
    $keyWords=array(
        'select',
        'from',
        'where',
        'join',
        'distinct'

    );
    switch($typeDB)
    {
    case 'mysql':
        $statement=$pdo->query("show databases");break;
    case 'mssql':
        $statement=$pdo->query("SELECT name FROM master.sys.databases");break;
    }
    $statement->execute();
    $databases = $statement->fetchAll(PDO::FETCH_NUM);
    foreach($databases as $db)
    {
        $keyWords[]=$db[0];
        switch($typeDB)
        {
        case 'mysql':
            $statement=$pdo->query("show tables in ".$db[0]);
            $statement->execute();
            $tables=$statement->fetchAll(PDO::FETCH_NUM);
            foreach($tables as $table)
            {
                $keyWords[]=$table[0];
                $keyWords[]=$db[0].'.'.$table[0];
            }
            break;
        case 'mssql':
            $statement=$pdo->query("use ".$db[0]);
            $statement->execute();
            $statement=$pdo->query("SELECT * FROM INFORMATION_SCHEMA.TABLES;");
            $statement->execute();
            $tables=$statement->fetchAll(PDO::FETCH_NUM);
            foreach($tables as $table)
            {
                $keyWords[]=$table[2];
                $keyWords[]=$db[0].'.'.$table[1].'.'.$table[2];
            }
            $statement=$pdo->query("SELECT TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS");
            $statement->execute();
            $fields=$statement->fetchAll(PDO::FETCH_NUM);
            foreach($fields as $field)
            {
                $keyWords[]=$field[1];
                $keyWords[]=$field[0].'.'.$field[1];
            }
            if($database!='')
            {
                $statement=$pdo->query("use $database");
                $statement->execute();
            }
            break;
        }
    }
    return $keyWords;
}
$phrases=getKeywords($pdo,$typeDB);
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
if($executeScript=='')
{
    while(true)
    {
        $val = readline($cons.">");
        if (!empty($val)) {
            readline_add_history($val);
        }
        $startTime=microtime(true);
        $table=runQuery($pdo,$val);
        $endTime=microtime(true);
        if(sizeof($table)>0)
        {
            echo outTable($table,0,$maxWidth)."\n";
        }
        echo sprintf(sizeof($table).' rows in set (%.4f sec)',$endTime-$startTime)."\n";
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
}
else
{
    $out="";
    $script=file_get_contents($executeScript);
    $scripts=explode('go',$script);
    if($vimOut)
    {
        $command='php '.$argv[0].' ';
        foreach($options as $key=>$value)
        {
            if($key!='vim')
            {
                if(strlen($key)>1)
                    $command.='-';
                $command.='-'.$key.' ';
                if($value!==false)
                {
                    $command.=$value.' ';
                }
            }
        }
        $command.=' --max-width 1000000';
        system($command.' | vim -c "set nowrap" - >/dev/tty');
#        system('php mysql.php --mssql -h CXBI -u admin -p Admin123 -s script.sql | vim -c "set nowrap" - >/dev/tty');
        #system('echo "'.$out.'" | vim -c "set nowrap" - >/dev/tty');
    }
    else
    {
        foreach($scripts as $sc)
        {
            $startTime=microtime(true);
            $table=runQuery($pdo,$sc);
            $endTime=microtime(true);
            if(sizeof($table)>0)
            {
                    $out.=outTable($table,0,$maxWidth)."\n";
            }
            $out.=sprintf(sizeof($table).' rows in set (%.4f sec)',$endTime-$startTime)."\n";
        }
        echo $out;
    }
}
?>

