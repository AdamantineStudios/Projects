package com.TJerousek;

import org.w3c.dom.ls.LSOutput;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Scanner;

public class Calculator extends Functions {
    double loanAmountC;
    double interestRateC;
    double repaymentPeriodC;
    // Variable that will store current monthly payment:
    double currentMonthlyRepay;
    String monthlyPaymentRender;
    String totalRepaymentAmountRender;
    String totalAmountOfInterestsRender;
    String loanAmountRender;



    public Calculator(double loanAmountC, double interestRateC, double repaymentPeriodC) {
        this.loanAmountC = loanAmountC;
        this.interestRateC = interestRateC;
        this.repaymentPeriodC = repaymentPeriodC;
    }

    public void setLoanAmountC(double loanAmountC) {
        this.loanAmountC = loanAmountC;
    }

    public void setInterestRateC(double interestRateC) {
        this.interestRateC = interestRateC;
    }

    public void setRepaymentPeriodC(double repaymentPeriodC) {
        this.repaymentPeriodC = repaymentPeriodC;
    }

    public double getLoanAmountC() {
        return loanAmountC;
    }

    public double getInterestRateC() {
        return interestRateC;
    }

    public double getRepaymentPeriodC() {
        return repaymentPeriodC;
    }

    public void createLoanRender() {
        String x = Double.toString(loanAmountC);
        loanAmountRender = x;
    }


    // formula from: http://www.aristoteles.cz/matematika/financni_matematika/hypoteka-vypocet.php
    public double siteFormula() {
        double i = interestRateC / 100 / 12;
        //System.out.println(i);
        double d = loanAmountC;
        double n = repaymentPeriodC * 12;
        double v = 1 / (1 + i); // MAYBE () FO SHO ()
        double a = (i * d) / (1 - Math.pow(v, n));
        return a;
    }


    // if theres time I need to clean the code
    public void monthlyPayment() {
        // We make rounded outcome for better user experience
        double roundedMonthlyPayment = Math.round(siteFormula() * 100.00) / 100.00;
        // we print outcome to the user
        currentMonthlyRepay = roundedMonthlyPayment;
        String x = Double.toString(currentMonthlyRepay);
        monthlyPaymentRender = x;
        System.out.println(
                "| Your monthly payment: " + roundedMonthlyPayment);
    }


    public void totalRepaymentAmount() {
        double totalPayment = siteFormula() * (repaymentPeriodC * 12);
        //Just for output reasons we will adjust the value of total payment to two decimal places
        double roundedTotalPayment = Math.round(totalPayment * 100.00) / 100.00;
        String x = Double.toString(roundedTotalPayment);
        totalRepaymentAmountRender = x;
        // We print outcome to the user
        System.out.println(
                "| Total amount that you'll pay us back: " + roundedTotalPayment);
    }

    public void totalAmountOfInterest() {
        double totalAmount = (siteFormula() * (repaymentPeriodC * 12)) - loanAmountC;
        // Create a rounded outcome so it doesnt look so trash
        double roundedTotalAmountOfInterest = Math.round(totalAmount * 100.00) / 100.00;
        String x = Double.toString(roundedTotalAmountOfInterest);
        totalAmountOfInterestsRender = x;
        System.out.println("| Amount of interests: " + roundedTotalAmountOfInterest + "\n");
    }

    // We should create function that will show up a question that asks user if he wants to see this overview
    public void showRepaymentOverview() {
        System.out.println("Do you want to show monthly repayment overview? (Y/N) ");
        Scanner in = new Scanner(System.in);
        String x = in.nextLine();
        // fuck I shoulve converted it to lowercase and check that nvm no time
        if (x.equals("Y") || x.equals("y") || x.equals("yes") || x.equals("Yes") || x.equals("YES")){
            System.out.println("You've selected: '" + x + "', printing out overview: ");
            monthlyPaymentsOverview();
        } else if (x.equals("N") || x.equals("n") || x.equals("No") || x.equals("no") || x.equals("NO")){
            System.out.println("You've chosen not to print out repayment overview.");
        }
        //System.out.println(repaymentOverviewMenus);
    }

    //Now we should creeate a method that will print out each monthly payment!
    // I should crate same spacing from number 1-9 as for 10 to more

    public void monthlyPaymentsOverview() {
        // We create a varible that store number of months
        int m = 1;
        for (int i = 0; i < (repaymentPeriodC * 12); i++) {
            if (m < 10) {
                System.out.println("| Payment in month " + m + ":  " + currentMonthlyRepay);
            } else {
                System.out.println("| Payment in month " + m + ": " + currentMonthlyRepay);
            }
            m++;
        }
    }

    // Writing a function that will put results in a file
    public void writeInAFile() {
        try {
            //Create a file
            FileWriter stream = new FileWriter(System.currentTimeMillis() + "Overview.txt");
            // identify file to write in:
            BufferedWriter out = new BufferedWriter(stream);
            out.write("Welcome to your repayment overview file: \n" +
                    "The amount you wanted to loan is: " + loanAmountRender + "\n" +
                    "The total amount you pay us back  in the end is: " + totalRepaymentAmountRender + "\n" +
                    "The amount of extra money you will pays us is: " + totalAmountOfInterestsRender + "\n" +
                    "Your monthly payment to us will be: " + monthlyPaymentRender + "\n");

            //Now we will print out into the file monthly repayments:
            int m = 1;
            for (int i = 0; i < (repaymentPeriodC * 12); i++) {
                String x = Integer.toString(m);
                if (m < 10){
                    out.write("| Payment in month " + x + ":  " + monthlyPaymentRender + "\n");
                } else {
                    out.write("| Payment in month " + x + ": " + monthlyPaymentRender + "\n");
                }
                m++;
            }

            // Close the output stream
            out.close();
        } catch (Exception e){
            System.out.println("Error: " + e.getMessage());
        }
    }
}






//double i = interestRateC / 100;
//double n = repaymentPeriodC * 12;
//double n = repaymentPeriodC;
//double f = 12;
//double i = ir / f;
//        LIKE HELLO? Anuity formula is aa a a  a a a   A  A A A  A  A  A
//        double result = loanAmountC * (i * (1 + n * i + Math.pow(i, n))) / ((1 + n * i + Math.pow(i, n)) - 1);
//double result = (i * loanAmountC) / (2 + Math.pow(i, n) - n * i);
//double result = (i * loanAmountC) / (1 - Math.pow((1 / 1 + i), n));
//double whatYouHaveToPayInTheEnd = (i * loanAmountC) + loanAmountC;
//double a = whatYouHaveToPayInTheEnd / 1 - Math.pow(v, n);
//        double v = 1 / (1 + i);
//        double a = (i * loanAmountC) / 1 - Math.pow(v, n);
// Alternative way
//double amountOfMonths = repaymentPeriodC * 12;
//double interestRate = interestRateC + (interestRateC / amountOfMonths);
//
//double frequency = repaymentPeriodC / interestRate;
// If you do 5% from 1 000 000 = 1 000 000/100*5
//5% = 5/100
//double endPayment = ((loanAmountC / 100) * interestRate) + loanAmountC;

//System.out.println(endPayment);


// asdasid32rur
//        double loanAmount = loanAmountC;
//        double interestRate = interestRateC / 100;
//        double repaymentPeriod = repaymentPeriodC * 12;
//        double interestRatePlusOne = interestRate + 1;
//
//        double firstPart = loanAmount * interestRate; // Loan amount is User input and interest rate is divided by 100 correctly from debugger // NO ISSUE
//        double secondPart = Math.pow(1 -(1 / interestRatePlusOne), repaymentPeriod);
//        //System.out.println(Math.pow(1 -(1 / interestRatePlusOne), repaymentPeriod));
//        double result = firstPart / secondPart;
//        System.out.println(result);


// Last try sssdsdsddpewoii, formula from site
//        double i = interestRateC / 100 / 12;
//        //System.out.println(i);
//        double d = loanAmountC;
//        double n = repaymentPeriodC * 12;
//        double v = 1 / (1 + i); // MAYBE () FO SHO ()
//        double a = (i * d) / (1 - Math.pow(v, n));
// We will create a rounded outcome for better user experience
//double interestTotalAmount = loanAmountC * (1 + interestRate);
//double monthlyPayment = interestTotalAmount / repaymentInMonths;
//System.out.println("You'll pay: " + monthlyPayment + " per month.");
//return monthlyPayment;

//        double interestRate = interestRateC / 100;
//        double repaymentInMonths = repaymentPeriodC * 12;
//        double interestTotalAmount = loanAmountC * (1 +interestRate);
//        System.out.println("You'll pay: " + interestTotalAmount + " in total.");
//        return interestTotalAmount;
// repetetive code if theres time put it in separate function !!!!!!!
//        double i = interestRateC / 100 / 12;
//        //System.out.println(i);
//        double d = loanAmountC;
//        double n = repaymentPeriodC * 12;
//        double v = 1 / (1 + i); // MAYBE () FO SHO ()
//        double a = (i * d) / (1 - Math.pow(v, n));
//        double totalPayment = a * n;