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

namespace Assignment5
{
    public partial class MainMenu : Form
    {
        /// <summary>
        /// Intance of the user class
        /// </summary>
        User myUser;

        /// <summary>
        /// Holds the users age
        /// </summary>
        int iUserAge;

        /// <summary>
        /// Instance of the game window
        /// </summary>
        GameWindow myGameWindow;

        /// <summary>
        /// Instance of the game class
        /// </summary>
        Game myGame;

        public MainMenu()
        {
            InitializeComponent();
            myUser = new User();
            myGame = new Game();
        }

        /// <summary>
        /// When the begin button is clicked, validates the info, then opens the game window
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnBegin_Click(object sender, EventArgs e)
        {
            try
            {
                Int32.TryParse(tbAge.Text, out iUserAge);
                if (tbName.Text == "")
                    lblNameErr.Text = "You must enter a name.";
                else if (iUserAge < 3 || iUserAge > 10 || tbAge.Text == "")
                    lblAgeErr.Text = "You must enter a valid age (3-10).";
                else if (rbAddition.Checked == false && rbSubtraction.Checked == false && rbMultiplication.Checked == false && rbDivision.Checked == false)
                    lblGameErr.Text = "You must choose a type of game.";
                else
                {
                    myUser.sName = tbName.Text;
                    myUser.sAge = tbAge.Text;
                    if (rbAddition.Checked == true)
                        myGame.gameType = "Add";
                    if (rbSubtraction.Checked == true)
                        myGame.gameType = "Subtract";
                    if (rbMultiplication.Checked == true)
                        myGame.gameType = "Multiply";
                    if (rbDivision.Checked == true)
                        myGame.gameType = "Divide";
                    this.Hide();
                    myGameWindow = new GameWindow(myGame, myUser);
                    myGameWindow.ShowDialog();
                    this.Show();
                }
            }
            catch (Exception ex)
            {
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name,
                           MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }
        /// <summary>
        /// Method to handle the exception
        /// </summary>
        /// <param name="sClass"></param>
        /// <param name="sMethod"></param>
        /// <param name="sMessage"></param>
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
