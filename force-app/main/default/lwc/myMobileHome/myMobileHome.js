import { LightningElement, wire } from 'lwc';
import getTicketsData from '@salesforce/apex/TicketsController.getTicektsData';

const journeyColumns = [
    { label: 'From', fieldName: 'from' },
    { label: 'To', fieldName: 'to' },
    {
        label: 'Date', fieldName: 'date', type: 'text'
    },
];

const ticketsColumns = [
    { label: 'Date', fieldName: 'date', type: 'text' },
    {
        label: 'Office', fieldName: 'office', cellAttributes: {
            style: { fieldName: 'officecolor' }
        }
    },
    {
        label: 'Home', fieldName: 'home', cellAttributes: {
            style: { fieldName: 'homecolor' }
        }
    }
];


const getTuesdaysInNext60Days = () => {
    const toDMY = d => {
        const [yyyy, mm, dd] = d.split('-');
        return `${dd}/${mm}/${yyyy}`;
    };
    const tuesdays = [];
    const today = new Date();

    for (let i = 0; i <= 60; i++) {
        const date = new Date();
        date.setDate(today.getDate() + i);

        if (date.getDay() === 2) {
            const formatted = date.toLocaleDateString('en-CA');
            tuesdays.push(toDMY(formatted));
        }
    }

    return tuesdays;
}

export default class MyMobileHome extends LightningElement {
    journeyData = [];
    journeyColumns = journeyColumns;

    ticketsData = [];
    ticketsColumns = ticketsColumns;

    isLoading = true;

    @wire(getTicketsData, { dates: getTuesdaysInNext60Days() })
    getTickets({ error, data }) {
        const toMDY = d => {
            const [dd, mm, yyyy] = d.split('/');
            return `${mm}-${dd}-${yyyy}`;
        };
        const arr = [];
        const result = JSON.parse(data || '{}');
        Object.keys(result).forEach(key => {
            arr.push({
                date: toMDY(key),
                office: result[key][0],
                home: result[key][1],
                homecolor: result[key][1] == 'Booked' ? 'background-color: green;' : !result[key][1].includes('AVAILABLE') ? 'background-color: red;' : '',
                officecolor: result[key][0] == 'Booked' ? 'background-color: green;' : !result[key][0].includes('AVAILABLE') ? 'background-color: red;' : '',
            })
        });
        this.ticketsData = arr.sort((a, b) => new Date(a.date) - new Date(b.date));
        if (this.ticketsData.length)
            this.isLoading = false;
    }
}