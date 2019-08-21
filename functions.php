<?php

function outTable($array,$limit=0){
    $screenWidth=140;
    $screenWidth=145;
    $maxSizes=array();
    if(isset($array[0]))
    {
        $numCols=sizeof($array[0]);
        foreach($array[0] as $key=>$value)
        {
            $maxSizes[$key]=mb_strlen($key.'','utf8');
        }
    }
    else
        return '';
    $sizeOut=0;
    foreach($array as $key=>$value)
    {
        foreach($value as $i=>$vl)
        {
            if(is_float($value[$i]))
            {
                $value[$i]=sprintf('%.3f',$value[$i]);
                $array[$key][$i]=$value[$i];
            }
            if($maxSizes[$i]<mb_strlen($value[$i].'','utf8'))
                $maxSizes[$i]=mb_strlen($value[$i].'','utf8');
        }
    }
    $size=0;
    foreach($maxSizes as $value)
    {
        $size+=$value+4;
    }
    $isOversize=false;
    if($size>$screenWidth)
    {
        $isOversize=true;
        $maxSizes=array();
        $numCols=sizeof($array[0]);
        foreach($array[0] as $key=>$value)
        {
            $maxSizes[$key]=mb_strlen($key.'','utf8');
        }
        foreach($array as $key=>$value)
        {
            foreach($value as $i=>$vl)
            {
                if(is_float($value[$i]))
                {
                    $value[$i]=sprintf('%.3f',$value[$i]);
                    $array[$key][$i]=$value[$i];
                }
                $temp=explode(' ',$value[$i]);
                $localMax=0;
                foreach($temp as $word)
                {
                    if($localMax<mb_strlen($word,'utf8'))
                        $localMax=mb_strlen($word,'utf8');
                }
                if($maxSizes[$i]<$localMax)
                    $maxSizes[$i]=$localMax;
            }
        }
    }
    $out="";
    $endTable='';
    $header='';
    $lastSymbol='|';
    foreach($array as $value)
    {
        $out.="";
        $row='';
        foreach($value as $i=>$vl)
        {
            if($isOversize)
            {
                #$value[$i]=str_replace(' ',"\n",$vl);
                if(mb_strlen($value[$i],'utf8')>$maxSizes[$i])
                {
                    $value[$i]=mb_substr($value[$i],0,$maxSizes[$i]-1,'utf8').'..';
                }
            }
           if($sizeOut==0)
            {
                $header.="| ".addSpaces($maxSizes[$i]+1,$i.'')."";
            }
            $row.="| ".addSpaces($maxSizes[$i]+1,$value[$i].'')."";
        }
        if($sizeOut==0)
        {
            if(mb_strlen($header,'utf8')>$screenWidth)
            {
                $lastSymbol=' ... >';
            }
            $out.="\n+";
            for($j=1;($j<mb_strlen($row,'utf8') && $j<$screenWidth);$j++)
            {
                $out.='-';
                $endTable.='-';
            }
            $out.="+\n";
            $out.=mb_substr($header,0,$screenWidth,'utf8').$lastSymbol.$out;
        }
 #       for($j=1;$j<strlen($row);$j++)
 #           $out.='-';
        #       $out.="||\n||".$row;
        $out.=mb_substr($row,0,$screenWidth,'utf8').$lastSymbol;
        $out.="\n";
        $sizeOut++;
        if($limit>0 && $sizeOut>$limit)
            break;
    }
    if($sizeOut>30)
    {
        $out.='+'.$endTable."+";
        $out.="\n".mb_substr($header,0,$screenWidth,'utf8').$lastSymbol."\n";
    }
#    $out.="||";
#    for($j=1;$j<strlen($row);$j++)
#        $out.='=';
    #     $out.="||\n";
    $out.='+'.$endTable."+";
    return $out;
}
function runQuery($pdo,$query){

    $keyWords=array(
        "use",
        "set"
    );
    $expl=explode(' ',$query);
    $table=array();
    if(in_array($expl[0],$keyWords))
    {
        $statement=$pdo->query($query);
        $statement->execute();
    }
    else
    {
        if(strlen($query)>3)
        {
            $statement=$pdo->query($query);
            $statement->execute();
            $table = $statement->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    return $table;
}
function addSpaces($length,$string){
    for($i=mb_strlen($string,'utf8');$i<$length;$i++)
        $string=$string.' ';
    return $string;
}
?>
