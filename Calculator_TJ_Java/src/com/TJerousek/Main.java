package com.TJerousek;

public class Main {

    public static void main(String[] args) {
        // Creating an instance of Functions
        Functions function = new Functions();
        // Render logo to user
        function.renderCalculatorLogo();
        // Render a function that gets loan input from user
        function.loanAmount();
        // Render a function that gets interest rate from user
        function.interestRate();
        // Render a function that gets repayment period from user in Years
        function.repaymentPeriodInYears();
        // Creating an instance of calculator
        Calculator calculator = new Calculator(function.loan, function.interestRate, function.repaymentPeriod);
        // Outputs to user his monthly payment
        calculator.monthlyPayment();
        // Outputs to user total repayment he has to pay
        calculator.totalRepaymentAmount();
        // Outputs to user total amount of interest he has to pay
        calculator.totalAmountOfInterest();
        // This method asks user if he wants to render payment overview in console and gets input yes or no in order to render the overview
        calculator.showRepaymentOverview();
        // This function just converts loan amount into string in order to be able write in file
        calculator.createLoanRender();
        // Function that writes in file all outcomes
        calculator.writeInAFile();


    }
}
