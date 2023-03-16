Feature: TEK Insurance API Test

  @deleteAccount
  Scenario: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenValue = call read("GenerateToken.feature")
    * def token = tokenValue.response.token
    * header Authorization = "Bearer" + token
    * path  "/api/accounts/delete-account"
    * def primaryPerson = call read("PostAccount.feature")
    * def id = primaryPerson.response.id
    * param primaryPersonId = id
    * method delete
    * status 200
