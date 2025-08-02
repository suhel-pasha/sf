import { LightningElement, wire } from 'lwc';

import getRecords from '@salesforce/apex/myApex.getRecords';

export default class MyLwcPage2 extends LightningElement {

columns = [
{label: 'name', fieldName: 'Name' }];

@wire(getRecords)
records;

}