@isTest
public class TestRestrictContactByName {
     @isTest
    static void testInvalidLastName() {
        // Create a Contact with an invalid last name
        Contact invalidContact = new Contact(FirstName = 'John', LastName = 'INVALIDNAME');

        // Try to insert the invalid Contact and verify that an exception is thrown
        Test.startTest();
        try {
            insert invalidContact;
            // If no exception is thrown, this line will be reached, and the test will fail
            System.assert(false, 'Expected exception was not thrown');
        } catch (DmlException e) {
            // Verify that the error message is as expected
            System.assert(e.getMessage().contains('The Last Name "'+invalidContact.LastName+'" is not allowed for DML'), 'Unexpected error message: ' + e.getMessage());
        }
        Test.stopTest();
    }
}