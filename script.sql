use cxbi
go
select
    SubscriberId
    ,1
    ,(CAST(cntdaily as float)+0.001) cntdaily
    ,(CAST(AHTdaily as float)+0.001) AHTdaily
    ,(CAST(ASPausedaily as float)+0.001) ASPausedaily
    ,(CAST(C0daily as float)+0.001) C0daily
    ,(CAST(C1daily as float)+0.001) C1daily
    ,(CAST(C2daily as float)+0.001) C2daily
    ,(CAST(A0daily as float)+0.001) A0daily
    ,(CAST(A1daily as float)+0.001) A1daily
    ,(CAST(A2daily as float)+0.001) A2daily
    ,(CAST(cntdaily as float)+0.000000001)/(cntweekly+0.000000001) as cntweekly
,(CAST(cntdaily as float)+0.000000001)/(cntweekly2+0.000000001) as cntweekly2
,(CAST(cntdaily as float)+0.000000001)/(cntmonthly+0.000000001) as cntmonthly
,(CAST(cntdaily as float)+0.000000001)/(cntmonthly2+0.000000001) as cntmonthly2
,(CAST(cntdaily as float)+0.000000001)/(cntyearly+0.000000001) as cntyearly
    ,(CAST(AHTdaily as float)+0.000000001)/(AHTweekly+0.000000001) as AHTweekly
,(CAST(AHTdaily as float)+0.000000001)/(AHTweekly2+0.000000001) as AHTweekly2
,(CAST(AHTdaily as float)+0.000000001)/(AHTmonthly+0.000000001) as AHTmonthly
,(CAST(AHTdaily as float)+0.000000001)/(AHTmonthly2+0.000000001) as AHTmonthly2
,(CAST(AHTdaily as float)+0.000000001)/(AHTyearly+0.000000001) as AHTyearly
    ,(CAST(ASPausedaily as float)+0.000000001)/(ASPauseweekly+0.000000001) as ASPauseweekly
,(CAST(ASPausedaily as float)+0.000000001)/(ASPauseweekly2+0.000000001) as ASPauseweekly2
,(CAST(ASPausedaily as float)+0.000000001)/(ASPausemonthly+0.000000001) as ASPausemonthly
,(CAST(ASPausedaily as float)+0.000000001)/(ASPausemonthly2+0.000000001) as ASPausemonthly2
,(CAST(ASPausedaily as float)+0.000000001)/(ASPauseyearly+0.000000001) as ASPauseyearly
    ,(CAST(C0daily as float)+0.000000001)/(C0weekly+0.000000001) as C0weekly
,(CAST(C0daily as float)+0.000000001)/(C0weekly2+0.000000001) as C0weekly2
,(CAST(C0daily as float)+0.000000001)/(C0monthly+0.000000001) as C0monthly
,(CAST(C0daily as float)+0.000000001)/(C0monthly2+0.000000001) as C0monthly2
,(CAST(C0daily as float)+0.000000001)/(C0yearly+0.000000001) as C0yearly
    ,(CAST(C1daily as float)+0.000000001)/(C1weekly+0.000000001) as C1weekly
,(CAST(C1daily as float)+0.000000001)/(C1weekly2+0.000000001) as C1weekly2
,(CAST(C1daily as float)+0.000000001)/(C1monthly+0.000000001) as C1monthly
,(CAST(C1daily as float)+0.000000001)/(C1monthly2+0.000000001) as C1monthly2
,(CAST(C1daily as float)+0.000000001)/(C1yearly+0.000000001) as C1yearly
    ,(CAST(C2daily as float)+0.000000001)/(C2weekly+0.000000001) as C2weekly
,(CAST(C2daily as float)+0.000000001)/(C2weekly2+0.000000001) as C2weekly2
,(CAST(C2daily as float)+0.000000001)/(C2monthly+0.000000001) as C2monthly
,(CAST(C2daily as float)+0.000000001)/(C2monthly2+0.000000001) as C2monthly2
,(CAST(C2daily as float)+0.000000001)/(C2yearly+0.000000001) as C2yearly
    ,(CAST(A0daily as float)+0.000000001)/(A0weekly+0.000000001) as A0weekly
,(CAST(A0daily as float)+0.000000001)/(A0weekly2+0.000000001) as A0weekly2
,(CAST(A0daily as float)+0.000000001)/(A0monthly+0.000000001) as A0monthly
,(CAST(A0daily as float)+0.000000001)/(A0monthly2+0.000000001) as A0monthly2
,(CAST(A0daily as float)+0.000000001)/(A0yearly+0.000000001) as A0yearly
    ,(CAST(A1daily as float)+0.000000001)/(A1weekly+0.000000001) as A1weekly
,(CAST(A1daily as float)+0.000000001)/(A1weekly2+0.000000001) as A1weekly2
,(CAST(A1daily as float)+0.000000001)/(A1monthly+0.000000001) as A1monthly
,(CAST(A1daily as float)+0.000000001)/(A1monthly2+0.000000001) as A1monthly2
,(CAST(A1daily as float)+0.000000001)/(A1yearly+0.000000001) as A1yearly
    ,(CAST(A2daily as float)+0.000000001)/(A2weekly+0.000000001) as A2weekly
,(CAST(A2daily as float)+0.000000001)/(A2weekly2+0.000000001) as A2weekly2
,(CAST(A2daily as float)+0.000000001)/(A2monthly+0.000000001) as A2monthly
,(CAST(A2daily as float)+0.000000001)/(A2monthly2+0.000000001) as A2monthly2
,(CAST(A2daily as float)+0.000000001)/(A2yearly+0.000000001) as A2yearly
    from (
    select 
    daily.SubscriberId
    ,daily.cntdaily
,daily.AHTdaily
,daily.ASPausedaily
,daily.C0daily
,daily.C1daily
,daily.C2daily
,daily.A0daily
,daily.A1daily
,daily.A2daily
    ,weekly.cntweekly
,weekly.AHTweekly
,weekly.ASPauseweekly
,weekly.C0weekly
,weekly.C1weekly
,weekly.C2weekly
,weekly.A0weekly
,weekly.A1weekly
,weekly.A2weekly
    ,weekly2.cntweekly2
,weekly2.AHTweekly2
,weekly2.ASPauseweekly2
,weekly2.C0weekly2
,weekly2.C1weekly2
,weekly2.C2weekly2
,weekly2.A0weekly2
,weekly2.A1weekly2
,weekly2.A2weekly2
    ,monthly.cntmonthly
,monthly.AHTmonthly
,monthly.ASPausemonthly
,monthly.C0monthly
,monthly.C1monthly
,monthly.C2monthly
,monthly.A0monthly
,monthly.A1monthly
,monthly.A2monthly
    ,monthly2.cntmonthly2
,monthly2.AHTmonthly2
,monthly2.ASPausemonthly2
,monthly2.C0monthly2
,monthly2.C1monthly2
,monthly2.C2monthly2
,monthly2.A0monthly2
,monthly2.A1monthly2
,monthly2.A2monthly2
    ,yearly.cntyearly
,yearly.AHTyearly
,yearly.ASPauseyearly
,yearly.C0yearly
,yearly.C1yearly
,yearly.C2yearly
,yearly.A0yearly
,yearly.A1yearly
,yearly.A2yearly
     from (
    
    select 
        SubscriberId
,count(*) cntdaily
        ,AVG(Duration) AHTdaily
        ,AVG(AgentAvgPause)/AVG(CustomerAvgPause+0.000000001) ASPausedaily
        ,AVG(CAST(A0 as float)) A0daily
        ,AVG(CAST(A1 as float)) A1daily
        ,AVG(CAST(A2 as float)) A2daily
        ,AVG(CAST(A4 as float)) A4daily
        ,AVG(CAST(C0 as float)) C0daily
        ,AVG(CAST(C1 as float)) C1daily
        ,AVG(CAST(C2 as float)) C2daily
        ,AVG(CAST(C4 as float)) C4daily
        from (
            select Calls_.Id, Calls_.Duration, Calls_.CallTime, Calls_.SubscriberId,CallMetrics.AgentAvgPause, CallMetrics.CustomerAvgPause, 
                CallMetrics.A0, CallMetrics.A1, CallMetrics.A2, CallMetrics.A4, CallMetrics.C0, CallMetrics.C1, CallMetrics.C2, CallMetrics.C4
            from Calls_
            join CallMetrics on (Calls_.Id = CallMetrics.CallId)
where DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime))=DATEFROMPARTS(2019,01,15)

            union 

            select Id,Duration, CallTime, SubscriberId, null, null, null, null, null, null, null, null, null, null 
            from CrCalls_ 
            where SADuplication=0
                and SubscriberId is not null
and DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime))=DATEFROMPARTS(2019,01,15)

        ) as tbl
    group by tbl.SubscriberId

    ) as daily
    left join(
    
    select 
        SubscriberId
,CAST(count(*) as float)/7 cntweekly
        ,AVG(Duration) AHTweekly
        ,AVG(AgentAvgPause)/AVG(CustomerAvgPause+0.000000001) ASPauseweekly
        ,AVG(CAST(A0 as float)) A0weekly
        ,AVG(CAST(A1 as float)) A1weekly
        ,AVG(CAST(A2 as float)) A2weekly
        ,AVG(CAST(A4 as float)) A4weekly
        ,AVG(CAST(C0 as float)) C0weekly
        ,AVG(CAST(C1 as float)) C1weekly
        ,AVG(CAST(C2 as float)) C2weekly
        ,AVG(CAST(C4 as float)) C4weekly
        from (
            select Calls_.Id, Calls_.Duration, Calls_.CallTime, Calls_.SubscriberId,CallMetrics.AgentAvgPause, CallMetrics.CustomerAvgPause, 
                CallMetrics.A0, CallMetrics.A1, CallMetrics.A2, CallMetrics.A4, CallMetrics.C0, CallMetrics.C1, CallMetrics.C2, CallMetrics.C4
            from Calls_
            join CallMetrics on (Calls_.Id = CallMetrics.CallId)
where DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-6,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

            union 

            select Id,Duration, CallTime, SubscriberId, null, null, null, null, null, null, null, null, null, null 
            from CrCalls_ 
            where SADuplication=0
                and SubscriberId is not null
and DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-6,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

        ) as tbl
    group by tbl.SubscriberId

    ) as weekly on(daily.SubscriberId=weekly.SubscriberId)
    left join(
    
    select 
        SubscriberId
,CAST(count(*) as float)/14 cntweekly2
        ,AVG(Duration) AHTweekly2
        ,AVG(AgentAvgPause)/AVG(CustomerAvgPause+0.000000001) ASPauseweekly2
        ,AVG(CAST(A0 as float)) A0weekly2
        ,AVG(CAST(A1 as float)) A1weekly2
        ,AVG(CAST(A2 as float)) A2weekly2
        ,AVG(CAST(A4 as float)) A4weekly2
        ,AVG(CAST(C0 as float)) C0weekly2
        ,AVG(CAST(C1 as float)) C1weekly2
        ,AVG(CAST(C2 as float)) C2weekly2
        ,AVG(CAST(C4 as float)) C4weekly2
        from (
            select Calls_.Id, Calls_.Duration, Calls_.CallTime, Calls_.SubscriberId,CallMetrics.AgentAvgPause, CallMetrics.CustomerAvgPause, 
                CallMetrics.A0, CallMetrics.A1, CallMetrics.A2, CallMetrics.A4, CallMetrics.C0, CallMetrics.C1, CallMetrics.C2, CallMetrics.C4
            from Calls_
            join CallMetrics on (Calls_.Id = CallMetrics.CallId)
where DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-13,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

            union 

            select Id,Duration, CallTime, SubscriberId, null, null, null, null, null, null, null, null, null, null 
            from CrCalls_ 
            where SADuplication=0
                and SubscriberId is not null
and DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-13,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

        ) as tbl
    group by tbl.SubscriberId

    ) as weekly2 on(daily.SubscriberId=weekly2.SubscriberId)
    left join(
        
    select 
        SubscriberId
,CAST(count(*) as float)/30 cntmonthly
        ,AVG(Duration) AHTmonthly
        ,AVG(AgentAvgPause)/AVG(CustomerAvgPause+0.000000001) ASPausemonthly
        ,AVG(CAST(A0 as float)) A0monthly
        ,AVG(CAST(A1 as float)) A1monthly
        ,AVG(CAST(A2 as float)) A2monthly
        ,AVG(CAST(A4 as float)) A4monthly
        ,AVG(CAST(C0 as float)) C0monthly
        ,AVG(CAST(C1 as float)) C1monthly
        ,AVG(CAST(C2 as float)) C2monthly
        ,AVG(CAST(C4 as float)) C4monthly
        from (
            select Calls_.Id, Calls_.Duration, Calls_.CallTime, Calls_.SubscriberId,CallMetrics.AgentAvgPause, CallMetrics.CustomerAvgPause, 
                CallMetrics.A0, CallMetrics.A1, CallMetrics.A2, CallMetrics.A4, CallMetrics.C0, CallMetrics.C1, CallMetrics.C2, CallMetrics.C4
            from Calls_
            join CallMetrics on (Calls_.Id = CallMetrics.CallId)
where DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-29,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

            union 

            select Id,Duration, CallTime, SubscriberId, null, null, null, null, null, null, null, null, null, null 
            from CrCalls_ 
            where SADuplication=0
                and SubscriberId is not null
and DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-29,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

        ) as tbl
    group by tbl.SubscriberId

    ) as monthly on(daily.SubscriberId=monthly.SubscriberId)
    left join(
            
    select 
        SubscriberId
,CAST(count(*) as float)/60 cntmonthly2
        ,AVG(Duration) AHTmonthly2
        ,AVG(AgentAvgPause)/AVG(CustomerAvgPause+0.000000001) ASPausemonthly2
        ,AVG(CAST(A0 as float)) A0monthly2
        ,AVG(CAST(A1 as float)) A1monthly2
        ,AVG(CAST(A2 as float)) A2monthly2
        ,AVG(CAST(A4 as float)) A4monthly2
        ,AVG(CAST(C0 as float)) C0monthly2
        ,AVG(CAST(C1 as float)) C1monthly2
        ,AVG(CAST(C2 as float)) C2monthly2
        ,AVG(CAST(C4 as float)) C4monthly2
        from (
            select Calls_.Id, Calls_.Duration, Calls_.CallTime, Calls_.SubscriberId,CallMetrics.AgentAvgPause, CallMetrics.CustomerAvgPause, 
                CallMetrics.A0, CallMetrics.A1, CallMetrics.A2, CallMetrics.A4, CallMetrics.C0, CallMetrics.C1, CallMetrics.C2, CallMetrics.C4
            from Calls_
            join CallMetrics on (Calls_.Id = CallMetrics.CallId)
where DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-59,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

            union 

            select Id,Duration, CallTime, SubscriberId, null, null, null, null, null, null, null, null, null, null 
            from CrCalls_ 
            where SADuplication=0
                and SubscriberId is not null
and DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-59,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

        ) as tbl
    group by tbl.SubscriberId

        ) as monthly2 on(daily.SubscriberId=monthly2.SubscriberId)
    left join(
            
    select 
        SubscriberId
,CAST(count(*) as float)/365 cntyearly
        ,AVG(Duration) AHTyearly
        ,AVG(AgentAvgPause)/AVG(CustomerAvgPause+0.000000001) ASPauseyearly
        ,AVG(CAST(A0 as float)) A0yearly
        ,AVG(CAST(A1 as float)) A1yearly
        ,AVG(CAST(A2 as float)) A2yearly
        ,AVG(CAST(A4 as float)) A4yearly
        ,AVG(CAST(C0 as float)) C0yearly
        ,AVG(CAST(C1 as float)) C1yearly
        ,AVG(CAST(C2 as float)) C2yearly
        ,AVG(CAST(C4 as float)) C4yearly
        from (
            select Calls_.Id, Calls_.Duration, Calls_.CallTime, Calls_.SubscriberId,CallMetrics.AgentAvgPause, CallMetrics.CustomerAvgPause, 
                CallMetrics.A0, CallMetrics.A1, CallMetrics.A2, CallMetrics.A4, CallMetrics.C0, CallMetrics.C1, CallMetrics.C2, CallMetrics.C4
            from Calls_
            join CallMetrics on (Calls_.Id = CallMetrics.CallId)
where DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-364,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

            union 

            select Id,Duration, CallTime, SubscriberId, null, null, null, null, null, null, null, null, null, null 
            from CrCalls_ 
            where SADuplication=0
                and SubscriberId is not null
and DATEFROMPARTS(DATEPART(yy,CallTime),DATEPART(mm,CallTime),DATEPART(dd,CallTime)) between DATEADD(dd,-364,DATEFROMPARTS(2019,01,15)) and DATEFROMPARTS(2019,01,15)

        ) as tbl
    group by tbl.SubscriberId

        ) as yearly on(daily.SubscriberId=yearly.SubscriberId)
    ) as tbl join Subscribers 
    on (tbl.SubscriberId = Subscribers.Id)
