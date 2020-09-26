using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Assignment3
{
    public partial class Scores : Form
    {
        int iNumStudents; //Variable to hold the number of students 
        int iNumAssignments; //Variable to hold the number of Assignments per student
        int iAssignmentNumber;  //Variable to keep track of the current assignment number
        int iAssignmentScore; //Variable to keep track of scores for that certain assignment number
        float[] average; //array to hold the averages of each student
        int[] sum; //array to hold the sum of grades for each student
        int iCounter; //counter to keep track of which student we are on
        string letterGrade; //varible for the letter grade of each student
        string[] studentNames; //array to hold the students names
        int[,] assignmentScores; //array to hold each students assigment scores
        public Scores()
        {
            InitializeComponent();
            lblStudentName.Text = "Student #" + (iCounter + 1) + ":";
            btnPrevStudent.Enabled = false;
        }
        /// <summary>
        /// Command fo what happens when the user submits the counts.
        /// Unlocks the rest of the form and check the input given for number of students
        /// and assignments
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSubmitCounts_Click(object sender, EventArgs e)
        {
            Int32.TryParse(tbNumStudents.Text, out iNumStudents);
            Int32.TryParse(tbNumAssign.Text, out iNumAssignments);
            studentNames = new String[iNumStudents];
            assignmentScores = new int[iNumStudents, iNumAssignments];
            if (iNumStudents < 1 || iNumStudents > 10)
            {
                lblNumberStudentsError.Text = "Error: # of students must be between 1-10.";
            }
            if (iNumAssignments < 1 || iNumAssignments > 99)
            {
                lblNumberAssignmentError.Text = "Error: # of assignments must be be between 1-99.";
            }
            else
            {
                lblNumberStudentsError.Text = "";
                lblNumberAssignmentError.Text = "";
                gbNav.Enabled = true;
                gbStudentName.Enabled = true;
                gbAssignmentInfo.Enabled = true;
                btnDisplayScore.Enabled = true;
                lblAssignInfo.Text = "Enter Assignment Number (1-" + iNumAssignments + "):";
                for(int i = 0; i< iNumStudents; i++)
                {
                    studentNames[i] = "Student #" + (i+1) + ":";
                }
                for(int i = 0; i < iNumStudents; i++)
                {
                    for (int j = 0; j < iNumAssignments; j++)
                    {
                        assignmentScores[i, j] = 0;
                    }
                }
            }
    }
        /// <summary>
        /// Command for what happens when the save name button is pushed.
        /// Loads the name into the array at the correct index
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSaveName_Click(object sender, EventArgs e)
        { 
            studentNames[iCounter] = tbStudentName.Text;
            lblStudentName.Text = studentNames[iCounter];
            tbStudentName.Text = "";
        }

        /// <summary>
        /// Retuns the index to 0 so it's on the first student
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnFirstStudent_Click(object sender, EventArgs e)
        {
            iCounter = 0;
            lblStudentName.Text = studentNames[iCounter];
            tbStudentName.Text = "";
        }

        /// <summary>
        /// subtracts the index by 1 so it can go back to the previous student
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnPrevStudent_Click(object sender, EventArgs e)
        {
            --iCounter;
            if (iCounter <= 0)
            {
                iCounter = 0;
                btnPrevStudent.Enabled = false;
            }
            if (iCounter < iNumStudents)
                btnNextStudent.Enabled = true;
            lblStudentName.Text = studentNames[iCounter];
            tbStudentName.Text = "";
        }

        /// <summary>
        /// add to the index by 1 so it can go to the next student
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnNextStudent_Click(object sender, EventArgs e)
        {
            ++iCounter;
            if (iCounter > 0)
                btnPrevStudent.Enabled = true;
            lblStudentName.Text = studentNames[iCounter];
            tbStudentName.Text = "";
            if (iCounter == iNumStudents-1)
            {
                btnNextStudent.Enabled = false;
            }       
        }

        /// <summary>
        /// puts the index all the way to the end so it can be on the last student.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnLastStudent_Click(object sender, EventArgs e)
        {
            iCounter = (studentNames.Length-1);
            lblStudentName.Text = studentNames[iCounter];
            tbStudentName.Text = "";
        }

        /// <summary>
        /// Saves the score for a particular student for a particular assignment
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSaveScore_Click(object sender, EventArgs e)
        {
            Int32.TryParse(tbAssignNum.Text, out iAssignmentNumber);
            Int32.TryParse(tbAssignScore.Text, out iAssignmentScore);
            assignmentScores[iCounter, iAssignmentNumber-1] = iAssignmentScore;
            tbAssignScore.Text = "";
            tbAssignNum.Text = "";
        }

        /// <summary>
        /// Displays the students names, the student's scores for each assignment, the average for each student
        /// and each students letter grade
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDisplayScore_Click(object sender, EventArgs e)
        {
            average = new float[iNumStudents];
            sum = new int[iNumStudents];
            rtbScores.Text = "SCORES\t";
            for(int i = 0; i < iNumAssignments; i++)
            {
                rtbScores.Text += "\t#" + (i+1) + "\t";
            }
            rtbScores.Text += "\tAVG\tGRADES\n";
            for (int i = 0; i < iNumStudents; i++)
            {
                rtbScores.Text += studentNames[i] + "\t";
                for (int j = 0; j < iNumAssignments; j++)
                {
                    sum[i] += assignmentScores[i, j];
                    rtbScores.Text += assignmentScores[i, j].ToString() + "\t\t";
                }
                average[i] = (float)sum[i] / iNumAssignments;
                rtbScores.Text += String.Format("{0:f2}",average[i]);
                if (average[i] >= 93)
                    letterGrade = "A";
                else if (average[i] >= 90 && average[i] < 93)
                    letterGrade = "A-";
                else if (average[i] >= 87 && average[i] < 90)
                    letterGrade = "B+";
                else if (average[i] >= 83 && average[i] < 87)
                    letterGrade = "B";
                else if (average[i] >= 80 && average[i] < 83 )
                    letterGrade = "B-";
                else if (average[i] >= 77 && average[i] < 80)
                    letterGrade = "C+";
                else if (average[i] >= 73 && average[i] < 77)
                    letterGrade = "C";
                else if (average[i] >= 70 && average[i] < 73)
                    letterGrade = "C-";
                else if (average[i] >= 67 && average[i] < 70)
                    letterGrade = "D+";
                else if (average[i] >= 63 && average[i] < 67)
                    letterGrade = "D";
                else if (average[i] >= 60 && average[i] < 63)
                    letterGrade = "D-";
                else
                    letterGrade = "E";
                rtbScores.Text += "\t" + letterGrade;
                rtbScores.Text += "\n";
            }
        }

        /// <summary>
        /// Resets the form to the original state, locks the buttons that are locked at the beginning
        /// and clear some labels to the original state
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnReset_Click(object sender, EventArgs e)
        {
            rtbScores.Text = "";
            lblNumberStudentsError.Text = "";
            lblNumberAssignmentError.Text = "";
            gbNav.Enabled = false;
            gbStudentName.Enabled = false;
            gbAssignmentInfo.Enabled = false;
            btnDisplayScore.Enabled = false;
            lblAssignInfo.Text = "Enter Assignment Number (1-" + iNumAssignments + "):";
            tbNumAssign.Text = "";
            tbNumStudents.Text = "";
            lblAssignInfo.Text = "Enter Assignment";
        }
    }
}
