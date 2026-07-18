/*
This is a class that is used as learning for queries, aggregates and Relationships in SOQl.
*/
public with sharing class queriesAggreRelationships {

    //scenario 1
    //Retrieve all Account names and their corresponding Industry from Salesforce.
    public static  List<Account> getAccountNamesAndindustry(){
        return [Select Name, Industry FROM Account ORDER BY Name ASC];
    }

    //scenario 2
    //Find the total number of Opportunities for each Account.
    public static List<Opporturnity> getTotalOppPerAcc(){

        //*** Use COUNT(Id) with GROUP BY. In Apex, aggregate queries return AggregateResult — not a standard sObject list!
        List<AggregateResult> results = [SELECT AccountId,Account.Name, Count(Id) FROM Opportunity AccountId,Account.Name ORDER BY Count(Id) DESC ];
        return results;
    }

    //scenario 3
    //Retrieve the names of Contacts associated with an Opportunity named "XYZ Opportunity."
    public static List<Contact> getContactsForSpecificOpp(){
        
        //Approach 1: fetching the contact using OpportunityContactRole junction Object.
        List<Contact> contacts = [Select Contact.Name, Contact.Email From OpportunityContactRole Where Opportunity.Name = 'XYZ Opportunity'];

        //Approach 2: fetching contact through a sub query.
        List<Contact> contacts2 = [Select Name, Email From Contact Where Id IN ( Select ContactId From OpportunityContactRole Where Opportunity.Name = 'XYZ Opportunity')];
    
        return contacts2;
    }

}