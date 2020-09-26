using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Reflection;
using System.Media;

namespace Assignment5
{
    public partial class GameWindow : Form
    {
        /// <summary>
        /// Instance of the game class
        /// </summary>
        Game myGame;

        /// <summary>
        /// Instance of the user class
        /// </summary>
        User myUser;

        /// <summary>
        /// Keeps track of what number of question we are on
        /// </summary>
        int numQuestion = 1;

        /// <summary>
        /// Instance of the scores window
        /// </summary>
        Scores myScore;

        /// <summary>
        /// Timer
        /// </summary>
        Timer myTimer;

        /// <summary>
        /// Counts our seconds
        /// </summary>
        int ticks;

        public GameWindow(Game gameTime, User userTime)
        {
            InitializeComponent();
            myGame = gameTime;
            myUser = userTime;
            myTimer = new Timer();
            tbAnswer.Hide();
            btnStart.Show();
            myGame.iNumOfIncorrectAnswers = 0;
            myGame.iNumOfCorrectAnswers = 0;
        }

        /// <summary>
        /// What contols the ticks and updates the timer
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void MyTimer_Tick(object sender, EventArgs e)
        {
            try
            {
                ++ticks;
                lblTimer.Text = ticks.ToString() + " Seconds.";
            }
            catch (Exception ex) // need to change to handle
            {
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// When the start button is clicked. Hides the start button and begins the timer
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnStart_Click(object sender, EventArgs e)
        {
            try
            {
                lblQuestion.Text =numQuestion.ToString() + ". " + myGame.generateQuestion();
                tbAnswer.Show();
                btnStart.Hide();
                myTimer.Start();
            }
            catch (Exception ex) // need to change to handle
            {
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name,
                           MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }

        /// <summary>
        /// When the submit button is clicked, checked to see if the answer is correct and does the appropriate things
        /// also increments question number
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                bool isAnswerCorrect;
                int userAnswer;
                Int32.TryParse(tbAnswer.Text, out userAnswer);
                isAnswerCorrect = myGame.isCorrect(userAnswer);
                numQuestion++;
                if (isAnswerCorrect)
                {
                    lblCorrect.Text = "Correct!";
                    lblCorrect.ForeColor = Color.Green;
                    SoundPlayer cheerSound = new SoundPlayer("cheer.wav");
                    cheerSound.Play();
                }
                else
                {
                    lblCorrect.Text = "Incorrect";
                    lblCorrect.ForeColor = Color.Red;
                    SoundPlayer jeerSound = new SoundPlayer("jeer.wav");
                    jeerSound.Play();
                }
                lblQuestion.Text = numQuestion.ToString() + ". " + myGame.generateQuestion();
                tbAnswer.Text = "";
                if(numQuestion == 10)
                {
                    btnSubmit.Text = "Finish!";
                }
                if(numQuestion > 10)
                {
                    lblCorrect.Text = "";
                    lblQNum.Text = "";
                    lblQuestion.Text = "";
                    this.Hide();
                    this.Close();
                    myScore = new Scores(myGame, myUser);
                    myScore.ShowDialog();
                    myTimer.Stop();
                }
            }
            catch (Exception ex) // need to change to handle
            {
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name,
                           MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }

        /// <summary>
        /// If the user ends the game early. Closes the game window and goes back to the main menu
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnEndGame_Click(object sender, EventArgs e)
        {
            try
            {
                this.Close();
            }
            catch (Exception ex) // need to change to handle
            {
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name,
                           MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }
        private void HandleError(string sClass, string sMethod, string sMessage)
        {
            try
            {
                //Would write to a file or database here.
                MessageBox.Show(sClass + "." + sMethod + " -> " + sMessage);
            }
            catch (Exception ex)
            {
                System.IO.File.AppendAllText("C:\\Error.txt", Environment.NewLine +
                                             "HandleError Exception: " + ex.Message);
            }
        }
    }
}
