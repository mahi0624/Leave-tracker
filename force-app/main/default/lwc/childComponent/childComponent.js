import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @api userName;
    @api userDetails;
    @api welcomeMessage;

}