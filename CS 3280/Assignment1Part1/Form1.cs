using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Assignment1Part1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        /// <summary>
        /// This is the funciton for if cmdSubmit1 button is clicked
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmdSubmit1_Click(object sender, EventArgs e)
        {
            DialogResult MyResult;
            MyResult = MessageBox.Show("You typed: " + textBox1.Text, "Attention", MessageBoxButtons.AbortRetryIgnore, MessageBoxIcon.Question);
            label4.Text = "You clicked the " + MyResult.ToString() + " button";
        }

        /// <summary>
        /// This is the function for if cmdSubmit2 button is clicked
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmdSubmit2_Click(object sender, EventArgs e)
        {
            DialogResult MyResult;
            MyResult = MessageBox.Show("You typed: " + textBox2.Text, "Attention", MessageBoxButtons.RetryCancel, MessageBoxIcon.Exclamation);
            label4.Text = "You clicked the " + MyResult.ToString() + " button";
        }

        /// <summary>
        /// This is the function for if cmdSubmit3 button is clicked
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmdSubmit3_Click(object sender, EventArgs e)
        {
            DialogResult MyResult;
            MyResult = MessageBox.Show("You typed: " + textBox3.Text, "Attention", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Hand);
            label4.Text = "You clicked the " + MyResult.ToString() + " button";
        }

    } //End class
} // end namespace
