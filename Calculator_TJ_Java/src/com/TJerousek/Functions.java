package com.TJerousek;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Functions {
    //This class will implement functions for our Calculator

    // Variables that are neccessary for our calculator:
    // Variable that store the amount of loan user wants
    double loan;
    // Variable that stores boolean
    boolean loanInput = false;
    // Variable that stores interest rate
    double interestRate;
    // Variable that controls while loop in interest rate
    boolean interestRateInput = false;
    // Variable that stores repayment period
    double repaymentPeriod;
    // Variable that stores repayment period in months
    double repaymentPeriodInMonths = repaymentPeriod * 12;
    // Variable that controls while loop in repayment period
    boolean repaymentPeriodInput = false;

    // This Function will render basicc alculator logo to the user
    public void renderCalculatorLogo() {
        System.out.println("-------------------------------\n" +
                "|          Calculator         |\n" +
                "-------------------------------");
    }

    // This function will ask user for loan amount an will store it into a variable ()
    public void loanAmount() {
        // We create loop that will keep asking user to enter loan, in case user enters wrong input the application will render again
        while (!loanInput) { //!Input same as input == false this is just smarter solution
            // We ask user to enter amount of money, we use \n to space away from calculator menus
            System.out.println("\n| Please enter how much money you wish to loan: ");
            // We create a Scanner that detects input from user, we use try and catch in order to navigate if user entered right characters
            try {
                Scanner in = new Scanner(System.in);
                // We store users input in our high scope variable
                loan = in.nextDouble();
                // We end while loop because user entered a right credentials
                loanInput = true;
                // Testing if our code works right
                //System.out.println(loan);

                // If User miss type his input and accidentally enters a letter
            } catch (InputMismatchException e){
                System.err.println("You've entered wrong characters, please try again and enter a number!");

            }
        }
    }
    // This function will ask user for amount of interest rate that he wants to connect to his loan amount and store it into a variable
    public void interestRate() {
        // We create while loop in order to control users input
        while (!interestRateInput) { //!Input same as input == false this is just smarter solution
            // We ask user (Write in console a question) interest rate he wishes to have
            //System.out.println("\n| Please enter interest rate: ");
            System.out.println("-------------------------------\n" +
                    "| Please enter interest rate: ");
            // We create a Scanner in try and catch in order to navigate through users mistakes
            try {
                Scanner in = new Scanner(System.in);
                interestRate = in.nextDouble();
                // We end up while loop here:
                interestRateInput = true;
                //Testing if output is right
                //System.out.println(interestRate);

                // If User miss type his input and accidentally enters a letter
            } catch (InputMismatchException e) {
                System.err.println("You've entered wrong characters, please try again and enter a number!");
            }
        }
    }
    // We Create a function that will ask user for amount of his repayment period
    public void repaymentPeriodInYears() {
        // We create while loop in order to control users input
        while (!repaymentPeriodInput) { //!Input same as input == false this is just smarter solution
            // We ask user (Write in console a question) interest rate he wishes to have
            //System.out.println("\n| Please enter repayment period: ");
            System.out.println("-------------------------------\n" +
                    "| Please enter repayment period: ");
            // We create a Scanner in try and catch in order to navigate through users mistakes
            try {
                Scanner in = new Scanner(System.in);
                 repaymentPeriod = in.nextDouble();
                // We end up while loop here:
                 repaymentPeriodInput= true;
                //Testing if output is right
                System.out.println();

                // If User miss type his input and accidentally enters a letter
            } catch (InputMismatchException e) {
                System.err.println("You've entered wrong characters, please try again and enter a number!");
            }
        }
    }



}
