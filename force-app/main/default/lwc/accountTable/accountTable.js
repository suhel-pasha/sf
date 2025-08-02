import {LightningElement, wire} from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts'

export default class AccountTable extends LightningElement {
	columns = [
		{label: 'Name', fieldName: 'Name'},
		{label: 'Industry', fieldName: 'Industry'}
	];

	@wire(getAccounts) accounts;


	get showRecords() {
		return this.accounts?.data?.length;
	}

	get noRecords() {
		return !this.accounts?.data?.length;
	}
}