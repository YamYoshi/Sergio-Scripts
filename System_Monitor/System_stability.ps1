$30DaysAgo = (Get-Date).AddDays(-30)

$Computers = Read_Host "Enter User(s)"

$ReliabilityStabilityMetrics = Get-CimInstance -ClassName win32_reliabilitystabilitymetrics -filter "TimeGenerated > '$30DaysAgo'" -ComputerName $Computers | Select-Object PSComputerName, SystemStabilityIndex, TimeGenerated

$ReliabilityRecords = Get-CimInstance -ClassName win32_reliabilityRecords -filter "TimeGenerated > '$30DaysAgo'" -ComputerName $Computers | Select-Object PSComputerName, EventIdentifier, LogFile, Message, ProductName, RecordNumber, SourceName, TimeGenerated

$ReliabilityStabilityMetrics | Export-CSV $env:USERPROFILE\Documents\ReliabilityStabilityMetrics.csv -Encoding ASCII ‑NoTypeInformation
$ReliabilityRecords | Export-CSV $env:USERPROFILE\Documents\ReliabilityRecords.csv ‑Encoding ASCII -NoTypeInformation