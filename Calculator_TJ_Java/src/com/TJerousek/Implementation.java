package com.TJerousek;

import java.util.InputMismatchException;
import java.util.Scanner;
// Code from lesson just for inspiration!!!!!
// A class that was assigned on a lesson, probably really good for starting homework project of a calculator
public class Implementation {
    // We want to store our numbers in two variables x and y most likely
    double x;
    double y;
    String operation;

    // We will start easy with an addition of two numbers
    public void userNumbersInsertion() {
        try {
            // We're asking user to enter a number one for our operation
            System.out.println("Please enter a number one: ");
            // This method should store our questioned number
            Scanner in = new Scanner(System.in);
            //Here we saving a number from user to our variable
            x = in.nextDouble();
        } catch (InputMismatchException e){
            System.out.println("This is not a number, please enter a number! \n" +
                    "... quiting application!");
            System.exit(1);
        }
        try {
            // We will ask number two from user
            System.out.println("Please enter a number two: ");
            // We store number two in different temp variable
            Scanner in1 = new Scanner(System.in);
            // We store number 2 in our variable
            y = in1.nextDouble();
        } catch (InputMismatchException e){
            System.out.println("This is not a number, please enter a number! \n" +
                    "... quiting application!");
            System.exit(2);
        }
    }
    // Function that is made just for testing purpose to check overtime if my code is working
    public void testingFunction(){
        System.out.println(x + y);
        System.out.println(operation);
    }

    // We will create function that will scan which operation user wants to run
    public void operation(){
        // We ask user for operation he wants to run
        System.out.println("Please choose from following operations: '+', '-', '*', '/'");
        //We starts scanning for users input
        Scanner in = new Scanner(System.in);
        // We store this input in a variable
        operation = in.nextLine();
    }

    // Now we create function that will run the command which will be adding two numbers together
    public void addingNumbers(double n1, double n2) {
        double result = n1 + n2;
        System.out.println( n1 + " + " + n2 + " equals to: " + result);
    }
    // Function for dividing two numbers
    public void dividingNumbers(double n1, double n2) {
        if (n1 == 0 || n2 == 0) {
            System.err.println("Dividing by: 0, not possible!");
        } else {
            double result = n1 / n2;
            System.out.println(n1 + " + " + n2 + " equals to: " + result);
        }

    }
    // Function for multiplying two numbers
    public void multiplyingNumbers(double n1, double n2) {
        double result = n1 * n2;
        System.out.println( n1 + " + " + n2 + " equals to: " + result);
    }
    // Function for two numbers difference
    public void differentialNumbers(double n1, double n2) {
        double result = n1 - n2;
        System.out.println( n1 + " + " + n2 + " equals to: " + result);
    }

    // Now we create a function that will perform all operations
    public void programCalculator() {
        userNumbersInsertion();
        operation();
        if (operation.equals("+")){
            //Now if operation from user is '+' then run adding number function
            addingNumbers(x, y);
        } else if (operation.equals("-")){
            // Now execute code for minus operation the difference
            differentialNumbers(x, y);
        } else if (operation.equals("/")){
            dividingNumbers(x, y);
        } else if (operation.equals("*")){
            multiplyingNumbers(x, y);
        } else {
            // if nothing else above then user is an idiot and fucked it up
            System.out.println("Invalid operation, please try again!");
        }
    }
}
