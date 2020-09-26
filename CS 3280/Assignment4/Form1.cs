using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Assignment4
{
    public partial class Form1 : Form
    {
        /// <summary>
        /// instance of TicTacToe class
        /// </summary>
        TicTacToe TicTac;
        /// <summary>
        /// Variable to hold whether game has started or not
        /// </summary>
        bool isGameStarted;
        /// <summary>
        /// To keep track of whose turn it is. Even numbers = "X" turn and Odd number = "O"
        /// </summary>
        int XorO;
        public Form1()
        {
            InitializeComponent();
            TicTac = new TicTacToe();
            isGameStarted = false;
            XorO = 0;
            lblPlayer1Wins.Text = "Player 1 Wins: " + TicTac.Player1Wins;
            lblPlayer2Wins.Text = "Player 2 Wins: " + TicTac.Player2Wins;
            lblTies.Text = "Ties: " + TicTac.Ties;
        }
        /// <summary>
        /// When start game is clicked, game board in unlocked, and game started = true
        /// all button content is set to "" and logic board is reset and resets the back color all columns
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnStart_Click(object sender, EventArgs e)
        {
            btn00.Text = "";
            btn01.Text = "";
            btn02.Text = "";
            btn10.Text = "";
            btn11.Text = "";
            btn12.Text = "";
            btn20.Text = "";
            btn21.Text = "";
            btn22.Text = "";
            btn00.BackColor = Color.Aqua;
            btn01.BackColor = Color.Aqua;
            btn02.BackColor = Color.Aqua;
            btn10.BackColor = Color.Aqua;
            btn11.BackColor = Color.Aqua;
            btn12.BackColor = Color.Aqua;
            btn20.BackColor = Color.Aqua;
            btn21.BackColor = Color.Aqua;
            btn22.BackColor = Color.Aqua;
            TicTac.resetLogicBoard();
            lblStatus.Text = "Player 1's Turn";
            isGameStarted = true;
            foreach(Button btn in this.Controls.OfType<Button>())
            {
                btn.Enabled = true;
            }
            XorO = 0;
        }
        /// <summary>
        /// When a space in the board in clicked, check whose turn it is, check if space is already full, then fill that space
        /// also check for winning move and check if there is a tie
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void boardClick(object sender, EventArgs e)
        {
            Button myButton = (Button)sender;
            if(XorO % 2 == 0 && myButton.Text == "")
            {
                lblStatus.Text = "Player 2's Turn";
                myButton.Text = "X";
                myButton.ForeColor = Color.Green;
                TicTac.setSpaceX(myButton.Name);
               if(TicTac.isWinningMove())
                {
                    highlightWin();
                    lblPlayer1Wins.Text = "Player 1 Wins: " + TicTac.Player1Wins;
                    lblStatus.Text = "Player 1 Wins";
                    foreach (Button btn in this.Controls.OfType<Button>())
                    {
                        btn.Enabled = false;
                    }
                    btnStart.Enabled = true;
                } 
            }
            if(XorO % 2 != 0 && myButton.Text == "")
            {
                lblStatus.Text = "Player 1's turn";
                myButton.Text = "O";
                myButton.ForeColor = Color.Red;
                TicTac.setSpaceO(myButton.Name);
                if (TicTac.isWinningMove())
                {
                    highlightWin();
                    lblPlayer2Wins.Text = "Player 2 Wins: " + TicTac.Player2Wins;
                    lblStatus.Text = "Player 2 Wins";
                    foreach (Button btn in this.Controls.OfType<Button>())
                    {
                        btn.Enabled = false;
                    }
                    btnStart.Enabled = true;
                }
            }
            if (TicTac.isTie() && TicTac.isWinningMove() == false)
            {
                lblTies.Text = "Ties: " + TicTac.Ties;
                lblStatus.Text = "Tie Game";
                foreach (Button btn in this.Controls.OfType<Button>())
                {
                    btn.Enabled = false;
                }
                btnStart.Enabled = true;
            }
            XorO++;
        }
        /// <summary>
        /// Highlights the winning move
        /// </summary>
        private void highlightWin()
        {
            if(TicTac.eWinningMove == TicTacToe.winningMove.row1)
            {
                btn00.BackColor = Color.Yellow;
                btn01.BackColor = Color.Yellow;
                btn02.BackColor = Color.Yellow;
            }
            if (TicTac.eWinningMove == TicTacToe.winningMove.row2)
            {
                btn10.BackColor = Color.Yellow;
                btn11.BackColor = Color.Yellow;
                btn12.BackColor = Color.Yellow;
            }
            if (TicTac.eWinningMove == TicTacToe.winningMove.row3)
            {
                btn20.BackColor = Color.Yellow;
                btn21.BackColor = Color.Yellow;
                btn22.BackColor = Color.Yellow;
            }
            if (TicTac.eWinningMove == TicTacToe.winningMove.col1)
            {
                btn00.BackColor = Color.Yellow;
                btn10.BackColor = Color.Yellow;
                btn20.BackColor = Color.Yellow;
            }
            if (TicTac.eWinningMove == TicTacToe.winningMove.col2)
            {
                btn01.BackColor = Color.Yellow;
                btn11.BackColor = Color.Yellow;
                btn21.BackColor = Color.Yellow;
            }
            if (TicTac.eWinningMove == TicTacToe.winningMove.col3)
            {
                btn02.BackColor = Color.Yellow;
                btn12.BackColor = Color.Yellow;
                btn22.BackColor = Color.Yellow;
            }
            if (TicTac.eWinningMove == TicTacToe.winningMove.diag1)
            {
                btn00.BackColor = Color.Yellow;
                btn11.BackColor = Color.Yellow;
                btn22.BackColor = Color.Yellow;
            }
            if (TicTac.eWinningMove == TicTacToe.winningMove.diag2)
            {
                btn02.BackColor = Color.Yellow;
                btn11.BackColor = Color.Yellow;
                btn20.BackColor = Color.Yellow;
            }
        }
    }
}
