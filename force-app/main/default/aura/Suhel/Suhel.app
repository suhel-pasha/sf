<aura:application controller="MyPrograms" implements="force:appHostable,flexipage:availableForAllPageTypes" extends="force:slds" access="global">
    <aura:attribute name="listPrograms" type="Program__c"/>
    <aura:attribute name="columnsToDisplay" type="List"/>
    <aura:attribute name="searchKeyworf" type="String"/>
    
    <aura:handler name="init" value="{!this}" action="{!c.doInit}" />
    
    <lightning:card iconName="standard:event" title="Programs">
    <lightning:layout>
        <lightning:layoutItem size="3" padding="around-small">
        <lightning:input aura:id="searchField"
                         label="Program Title"
                         value="{!v.searchKeyword}"
                         placeholder="Ex:Palindrome"
                         onchange="{!c.searchPrograms}" />
        </lightning:layoutItem>
         <lightning:layoutItem size="3" padding="around-small">
         <lightning:button variant="destructive" 
                           label="New" 
                           title="New" 
                           onclick="{!c.navigate}"/>

        </lightning:layoutItem>
       
        
        </lightning:layout>
        
        <lightning:datatable data="{!v.listPrograms}"
                  columns="{!v.columnsToDisplay}"
                  keyField="Name"
                             hideCheckboxColumn="true" />
    
    </lightning:card>
	
</aura:application>