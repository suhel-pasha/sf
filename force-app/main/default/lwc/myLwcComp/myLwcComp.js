import { LightningElement, wire } from 'lwc';
import getTickets from '@salesforce/apex/MyClass.getTickets';

export default class MyLwcComp extends LightningElement {

	columns = [
		{ label: 'Name', fieldName: 'Name'}
	];
	
	@wire(getTickets) tickets;
	
}