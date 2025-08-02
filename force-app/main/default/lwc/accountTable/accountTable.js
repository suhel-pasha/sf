import {LightningElement, wire} from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import { NavigationMixin } from 'lightning/navigation';

const actions = [
   { label: 'View', name: 'view' }
];

export default class AccountTable extends NavigationMixin(LightningElement) {
	columns = [
		{label: 'Name', fieldName: 'Name'},
		{label: 'Industry', fieldName: 'Industry'},
		{type: 'action', typeAttributes: { rowActions: actions } }
	];

	@wire(getAccounts) accounts;


	get showRecords() {
		return this.accounts?.data?.length;
	}

	get noRecords() {
		return !this.accounts?.data?.length;
	}

	handleRowAction(event) {
	const actionName = event.detail.action.name;
	const row = event.detail.row;
	if(actionName === 'view') {
	 this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: row.Id,
                    objectApiName: 'Account',
                    actionName: 'view'
                }
            });	
	}
	}
}