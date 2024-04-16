import {LightningElement,api,track,wire } from 'lwc';
import getUserLIst from '@salesforce/apex/LeaveRequstController.getUserList';
const Coloumns=[
    { label: 'Name', fieldName: 'Name'},
    { label: 'Phone', fieldName: 'Phone'},
    { label: 'Username', fieldName: 'Username'}
]

export default class ParentComponent extends LightningElement {
    name="Mahendra Jaagalamarri";
    @track userdetails={
        name:"mahendra",
        age:24,
        city:"Banglore"

    }
    welMes=`"Hi,"welcome to Lwc"`;
    Col=Coloumns;
    
    @wire(getUserLIst) userdetails;
    
    
    
    
}
