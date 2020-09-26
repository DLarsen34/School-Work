using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
using System.Windows.Forms;

namespace Assignment5
{
    public class Game
    {
        /// <summary>
        /// Stores the operand on the left side of the equation
        /// </summary>
        public int iLeftHandOperand;

        /// <summary>
        /// Stores the operand on the right side of the equation
        /// </summary>
        public int iRightHandOperand;

        /// <summary>
        /// Stores the correct answer
        /// </summary>
        public int iCorrectAnswer = 0;

        /// <summary>
        /// Holds the number of correct answers
        /// </summary>
        public int iNumOfCorrectAnswers = 0;

        /// <summary>
        /// Holds the number of incorrect answers
        /// </summary>
        public int iNumOfIncorrectAnswers = 0;

        /// <summary>
        /// Holds what type of game is chosen
        /// </summary>
        public string gameType;

        /// <summary>
        /// Holds the question
        /// </summary>
        public string question;

        /// <summary>
        /// Needed to generate random numbers
        /// </summary>
        Random randNum = new Random();

        /// <summary>
        /// Holds the question number
        /// </summary>
        public int numQuestion = 1;

        /// <summary>
        /// Generates the question
        /// </summary>
        /// <returns></returns>
        public string generateQuestion()
        {
            try
            {
                if(gameType == "Add")
                {
                    iLeftHandOperand = randNum.Next(0, 11);
                    iRightHandOperand = randNum.Next(0, 11);
                    question = iLeftHandOperand.ToString() + " + " + iRightHandOperand.ToString() + " =";
                }
                if (gameType == "Subtract")
                {
                    do
                    {
                        iLeftHandOperand = randNum.Next(0, 11);
                        iRightHandOperand = randNum.Next(0, 11);
                    } while (iLeftHandOperand < iRightHandOperand);
                    question = iLeftHandOperand.ToString() + " - " + iRightHandOperand.ToString() + " =";
                }
                if (gameType == "Multiply")
                {
                    iLeftHandOperand = randNum.Next(0, 11);
                    iRightHandOperand = randNum.Next(0, 11);
                    question = iLeftHandOperand.ToString() + " * " + iRightHandOperand.ToString() + " =";
                }
                if (gameType == "Divide")
                {
                    do
                    {
                        iLeftHandOperand = randNum.Next(0, 11);
                        iRightHandOperand = randNum.Next(1, 11);
                    } while (iLeftHandOperand % iRightHandOperand != 0);
                    question = iLeftHandOperand.ToString() + " / " + iRightHandOperand.ToString() + " =";
                }
                return question;
            }
            catch (Exception ex)
            {
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                                  MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// Generates the correct answer
        /// </summary>
        /// <param name="iLH"></param>
        /// <param name="iRH"></param>
        /// <returns></returns>
        public int getCorrectAnswer(int iLH, int iRH)
        {
            try
            {
                if (gameType == "Add")
                    iCorrectAnswer = iLH + iRH;
                if (gameType == "Subtract")
                    iCorrectAnswer = iLH - iRH;
                if (gameType == "Multiply")
                    iCorrectAnswer = iLH * iRH;
                if (gameType == "Divide")
                    iCorrectAnswer = iLH / iRH;
                return iCorrectAnswer;
            }
            catch (Exception ex)
            {
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                                  MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// Checks to see the user input is the correct answer
        /// </summary>
        /// <param name="userAnswer"></param>
        /// <returns></returns>
        public bool isCorrect(int userAnswer)
        {
            try
            {
                iCorrectAnswer = getCorrectAnswer(iLeftHandOperand, iRightHandOperand);
                if (userAnswer == iCorrectAnswer)
                {
                    iNumOfCorrectAnswers++;
                    return true;
                }
                else
                {
                    iNumOfIncorrectAnswers++;
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                                  MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }
    }
}
