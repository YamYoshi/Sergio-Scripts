$domain = [adsi] "LDAP://localhost:389/dc=fizz,dc=buzz"
$searcher = [adsisearcher] $domain
$searcher.Filter = '(&(objectClass=User)(displayName= User ))'
$userResult = $searcher.FindOne()
$user = $userResult.GetDirectoryEntry()
$user