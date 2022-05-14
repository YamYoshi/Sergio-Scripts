$domain = [adsi] "Enter Domain"
$OU = $domain.Create("OrganizationalUnit", "OU=OU_name")
$OU.Put("Description", "Name")
$OU.Put("wwwHomePage", "http://Domain")
$OU.SetInfo()