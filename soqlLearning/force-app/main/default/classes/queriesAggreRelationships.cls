/*
This is a class that is used as learning for queries, aggregates and Relationships in SOQl.
*/
public with sharing class queriesAggreRelationships {
    //Retrieve all Account names and their corresponding Industry from Salesforce.
    public static  List<Account> getAccountNamesAndindustry(){
        return [Select Name, Industry FROM Account ORDER BY Name ASC];
    }

    //Find the total number of Opportunities for each Account.
    public static List<Opporturnity> getTotalOppPerAcc(){

        //*** Use COUNT(Id) with GROUP BY. In Apex, aggregate queries return AggregateResult — not a standard sObject list!
        List<AggregateResult> results = [SELECT AccountId,Account.Name, Count(Id) FROM Opportunity AccountId,Account.Name ORDER BY Count(Id) DESC ];

        return results;
    }

    
}