1. There are three API endpoints

a) /reset    (GET)

    This endpoint will reset both users amount to 10000

  b) /transfer       (POST)

    Expecting form data body

    {
      transfer_from: <transfer from userID, can be 1 or 2>,
      transfer_to: <transfer to userID, can be 1 or 2>
      amount: <amount to transfer>
    }

  This endpoint should transfer the token between users and update the user amount.

  c) /get_amounts          (GET)

      This endpoint should print out users current amount.

2. Host 5 instances of duplicate server range from port 10300 ~ 10304, your server should be accessible at http://localhost:10300, http://localhost:10301, http://localhost:10302 … etc

3. Run the test script using command “ruby stress_test.rb”