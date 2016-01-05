<#assign currentDate = .now>
Current Date : ${currentDate?date}<br>
<#assign numberOfDays = 30?long>
<#assign timeInMillisecond = (1000 * 60 * 60 * 24 * numberOfDays) >
<#assign aDate = currentDate?long - timeInMillisecond?long>
<#assign Diff = aDate?long>
<#assign thirtyDaysBeforeDate = Diff?number_to_date>
<br>Date before ${numberOfDays} Days : ${thirtyDaysBeforeDate}<br>
<br>Date before ${numberOfDays} Days in UTC format : ${thirtyDaysBeforeDate?iso_utc}<br>

