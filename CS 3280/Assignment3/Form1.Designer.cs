namespace Assignment3
{
    partial class Scores
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.gbCounts = new System.Windows.Forms.GroupBox();
            this.lblNumberAssignmentError = new System.Windows.Forms.Label();
            this.lblNumberStudentsError = new System.Windows.Forms.Label();
            this.lblNumAssignError = new System.Windows.Forms.Label();
            this.lblStudentError = new System.Windows.Forms.Label();
            this.btnSubmitCounts = new System.Windows.Forms.Button();
            this.tbNumAssign = new System.Windows.Forms.TextBox();
            this.tbNumStudents = new System.Windows.Forms.TextBox();
            this.lblNumAssign = new System.Windows.Forms.Label();
            this.lblNumStudents = new System.Windows.Forms.Label();
            this.btnReset = new System.Windows.Forms.Button();
            this.gbNav = new System.Windows.Forms.GroupBox();
            this.btnLastStudent = new System.Windows.Forms.Button();
            this.btnNextStudent = new System.Windows.Forms.Button();
            this.btnPrevStudent = new System.Windows.Forms.Button();
            this.btnFirstStudent = new System.Windows.Forms.Button();
            this.gbStudentName = new System.Windows.Forms.GroupBox();
            this.btnSaveName = new System.Windows.Forms.Button();
            this.tbStudentName = new System.Windows.Forms.TextBox();
            this.lblStudentName = new System.Windows.Forms.Label();
            this.gbAssignmentInfo = new System.Windows.Forms.GroupBox();
            this.btnSaveScore = new System.Windows.Forms.Button();
            this.tbAssignScore = new System.Windows.Forms.TextBox();
            this.lblAssignmentScore = new System.Windows.Forms.Label();
            this.tbAssignNum = new System.Windows.Forms.TextBox();
            this.lblAssignInfo = new System.Windows.Forms.Label();
            this.btnDisplayScore = new System.Windows.Forms.Button();
            this.rtbScores = new System.Windows.Forms.RichTextBox();
            this.gbCounts.SuspendLayout();
            this.gbNav.SuspendLayout();
            this.gbStudentName.SuspendLayout();
            this.gbAssignmentInfo.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbCounts
            // 
            this.gbCounts.Controls.Add(this.lblNumberAssignmentError);
            this.gbCounts.Controls.Add(this.lblNumberStudentsError);
            this.gbCounts.Controls.Add(this.lblNumAssignError);
            this.gbCounts.Controls.Add(this.lblStudentError);
            this.gbCounts.Controls.Add(this.btnSubmitCounts);
            this.gbCounts.Controls.Add(this.tbNumAssign);
            this.gbCounts.Controls.Add(this.tbNumStudents);
            this.gbCounts.Controls.Add(this.lblNumAssign);
            this.gbCounts.Controls.Add(this.lblNumStudents);
            this.gbCounts.Location = new System.Drawing.Point(12, 12);
            this.gbCounts.Name = "gbCounts";
            this.gbCounts.Size = new System.Drawing.Size(544, 100);
            this.gbCounts.TabIndex = 0;
            this.gbCounts.TabStop = false;
            this.gbCounts.Text = "Counts";
            // 
            // lblNumberAssignmentError
            // 
            this.lblNumberAssignmentError.AutoSize = true;
            this.lblNumberAssignmentError.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNumberAssignmentError.ForeColor = System.Drawing.Color.Red;
            this.lblNumberAssignmentError.Location = new System.Drawing.Point(67, 83);
            this.lblNumberAssignmentError.Name = "lblNumberAssignmentError";
            this.lblNumberAssignmentError.Size = new System.Drawing.Size(0, 20);
            this.lblNumberAssignmentError.TabIndex = 8;
            // 
            // lblNumberStudentsError
            // 
            this.lblNumberStudentsError.AutoSize = true;
            this.lblNumberStudentsError.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNumberStudentsError.ForeColor = System.Drawing.Color.Red;
            this.lblNumberStudentsError.Location = new System.Drawing.Point(67, 0);
            this.lblNumberStudentsError.Name = "lblNumberStudentsError";
            this.lblNumberStudentsError.Size = new System.Drawing.Size(0, 20);
            this.lblNumberStudentsError.TabIndex = 7;
            // 
            // lblNumAssignError
            // 
            this.lblNumAssignError.AutoSize = true;
            this.lblNumAssignError.BackColor = System.Drawing.Color.Transparent;
            this.lblNumAssignError.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNumAssignError.ForeColor = System.Drawing.Color.Red;
            this.lblNumAssignError.Location = new System.Drawing.Point(377, 80);
            this.lblNumAssignError.Name = "lblNumAssignError";
            this.lblNumAssignError.Size = new System.Drawing.Size(0, 20);
            this.lblNumAssignError.TabIndex = 6;
            // 
            // lblStudentError
            // 
            this.lblStudentError.AutoSize = true;
            this.lblStudentError.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStudentError.ForeColor = System.Drawing.Color.Red;
            this.lblStudentError.Location = new System.Drawing.Point(347, 15);
            this.lblStudentError.Name = "lblStudentError";
            this.lblStudentError.Size = new System.Drawing.Size(0, 20);
            this.lblStudentError.TabIndex = 5;
            // 
            // btnSubmitCounts
            // 
            this.btnSubmitCounts.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnSubmitCounts.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSubmitCounts.Location = new System.Drawing.Point(380, 34);
            this.btnSubmitCounts.Name = "btnSubmitCounts";
            this.btnSubmitCounts.Size = new System.Drawing.Size(142, 42);
            this.btnSubmitCounts.TabIndex = 4;
            this.btnSubmitCounts.Text = "Submit Counts";
            this.btnSubmitCounts.UseVisualStyleBackColor = false;
            this.btnSubmitCounts.Click += new System.EventHandler(this.btnSubmitCounts_Click);
            // 
            // tbNumAssign
            // 
            this.tbNumAssign.Location = new System.Drawing.Point(267, 60);
            this.tbNumAssign.Name = "tbNumAssign";
            this.tbNumAssign.Size = new System.Drawing.Size(50, 22);
            this.tbNumAssign.TabIndex = 3;
            // 
            // tbNumStudents
            // 
            this.tbNumStudents.Location = new System.Drawing.Point(267, 32);
            this.tbNumStudents.Name = "tbNumStudents";
            this.tbNumStudents.Size = new System.Drawing.Size(50, 22);
            this.tbNumStudents.TabIndex = 2;
            // 
            // lblNumAssign
            // 
            this.lblNumAssign.AutoSize = true;
            this.lblNumAssign.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNumAssign.Location = new System.Drawing.Point(54, 60);
            this.lblNumAssign.Name = "lblNumAssign";
            this.lblNumAssign.Size = new System.Drawing.Size(194, 20);
            this.lblNumAssign.TabIndex = 1;
            this.lblNumAssign.Text = "Number of Assignments:";
            // 
            // lblNumStudents
            // 
            this.lblNumStudents.AutoSize = true;
            this.lblNumStudents.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNumStudents.Location = new System.Drawing.Point(85, 34);
            this.lblNumStudents.Name = "lblNumStudents";
            this.lblNumStudents.Size = new System.Drawing.Size(163, 20);
            this.lblNumStudents.TabIndex = 0;
            this.lblNumStudents.Text = "Number of Students:";
            // 
            // btnReset
            // 
            this.btnReset.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReset.Location = new System.Drawing.Point(599, 32);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(127, 56);
            this.btnReset.TabIndex = 1;
            this.btnReset.Text = "Reset\r\nScores";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // gbNav
            // 
            this.gbNav.Controls.Add(this.btnLastStudent);
            this.gbNav.Controls.Add(this.btnNextStudent);
            this.gbNav.Controls.Add(this.btnPrevStudent);
            this.gbNav.Controls.Add(this.btnFirstStudent);
            this.gbNav.Enabled = false;
            this.gbNav.Location = new System.Drawing.Point(12, 118);
            this.gbNav.Name = "gbNav";
            this.gbNav.Size = new System.Drawing.Size(713, 100);
            this.gbNav.TabIndex = 2;
            this.gbNav.TabStop = false;
            this.gbNav.Text = "Navigate";
            // 
            // btnLastStudent
            // 
            this.btnLastStudent.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLastStudent.Location = new System.Drawing.Point(525, 33);
            this.btnLastStudent.Name = "btnLastStudent";
            this.btnLastStudent.Size = new System.Drawing.Size(162, 47);
            this.btnLastStudent.TabIndex = 3;
            this.btnLastStudent.Text = ">> Last Student";
            this.btnLastStudent.UseVisualStyleBackColor = true;
            this.btnLastStudent.Click += new System.EventHandler(this.btnLastStudent_Click);
            // 
            // btnNextStudent
            // 
            this.btnNextStudent.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNextStudent.Location = new System.Drawing.Point(360, 33);
            this.btnNextStudent.Name = "btnNextStudent";
            this.btnNextStudent.Size = new System.Drawing.Size(159, 47);
            this.btnNextStudent.TabIndex = 2;
            this.btnNextStudent.Text = "> Next Student";
            this.btnNextStudent.UseVisualStyleBackColor = true;
            this.btnNextStudent.Click += new System.EventHandler(this.btnNextStudent_Click);
            // 
            // btnPrevStudent
            // 
            this.btnPrevStudent.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPrevStudent.Location = new System.Drawing.Point(188, 33);
            this.btnPrevStudent.Name = "btnPrevStudent";
            this.btnPrevStudent.Size = new System.Drawing.Size(166, 47);
            this.btnPrevStudent.TabIndex = 1;
            this.btnPrevStudent.Text = "< Prev Student";
            this.btnPrevStudent.UseVisualStyleBackColor = true;
            this.btnPrevStudent.Click += new System.EventHandler(this.btnPrevStudent_Click);
            // 
            // btnFirstStudent
            // 
            this.btnFirstStudent.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFirstStudent.Location = new System.Drawing.Point(17, 33);
            this.btnFirstStudent.Name = "btnFirstStudent";
            this.btnFirstStudent.Size = new System.Drawing.Size(165, 47);
            this.btnFirstStudent.TabIndex = 0;
            this.btnFirstStudent.Text = "<< First Student";
            this.btnFirstStudent.UseVisualStyleBackColor = true;
            this.btnFirstStudent.Click += new System.EventHandler(this.btnFirstStudent_Click);
            // 
            // gbStudentName
            // 
            this.gbStudentName.Controls.Add(this.btnSaveName);
            this.gbStudentName.Controls.Add(this.tbStudentName);
            this.gbStudentName.Controls.Add(this.lblStudentName);
            this.gbStudentName.Enabled = false;
            this.gbStudentName.Location = new System.Drawing.Point(12, 224);
            this.gbStudentName.Name = "gbStudentName";
            this.gbStudentName.Size = new System.Drawing.Size(714, 80);
            this.gbStudentName.TabIndex = 3;
            this.gbStudentName.TabStop = false;
            this.gbStudentName.Text = "Student Name";
            // 
            // btnSaveName
            // 
            this.btnSaveName.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSaveName.Location = new System.Drawing.Point(520, 23);
            this.btnSaveName.Name = "btnSaveName";
            this.btnSaveName.Size = new System.Drawing.Size(141, 42);
            this.btnSaveName.TabIndex = 2;
            this.btnSaveName.Text = "Save Name";
            this.btnSaveName.UseVisualStyleBackColor = true;
            this.btnSaveName.Click += new System.EventHandler(this.btnSaveName_Click);
            // 
            // tbStudentName
            // 
            this.tbStudentName.Location = new System.Drawing.Point(152, 34);
            this.tbStudentName.Name = "tbStudentName";
            this.tbStudentName.Size = new System.Drawing.Size(265, 22);
            this.tbStudentName.TabIndex = 1;
            // 
            // lblStudentName
            // 
            this.lblStudentName.AutoSize = true;
            this.lblStudentName.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStudentName.Location = new System.Drawing.Point(38, 34);
            this.lblStudentName.Name = "lblStudentName";
            this.lblStudentName.Size = new System.Drawing.Size(0, 20);
            this.lblStudentName.TabIndex = 0;
            // 
            // gbAssignmentInfo
            // 
            this.gbAssignmentInfo.Controls.Add(this.btnSaveScore);
            this.gbAssignmentInfo.Controls.Add(this.tbAssignScore);
            this.gbAssignmentInfo.Controls.Add(this.lblAssignmentScore);
            this.gbAssignmentInfo.Controls.Add(this.tbAssignNum);
            this.gbAssignmentInfo.Controls.Add(this.lblAssignInfo);
            this.gbAssignmentInfo.Enabled = false;
            this.gbAssignmentInfo.Location = new System.Drawing.Point(13, 320);
            this.gbAssignmentInfo.Name = "gbAssignmentInfo";
            this.gbAssignmentInfo.Size = new System.Drawing.Size(712, 100);
            this.gbAssignmentInfo.TabIndex = 4;
            this.gbAssignmentInfo.TabStop = false;
            this.gbAssignmentInfo.Text = "Assignment Info";
            // 
            // btnSaveScore
            // 
            this.btnSaveScore.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSaveScore.Location = new System.Drawing.Point(480, 43);
            this.btnSaveScore.Name = "btnSaveScore";
            this.btnSaveScore.Size = new System.Drawing.Size(140, 31);
            this.btnSaveScore.TabIndex = 4;
            this.btnSaveScore.Text = "Save Score";
            this.btnSaveScore.UseVisualStyleBackColor = true;
            this.btnSaveScore.Click += new System.EventHandler(this.btnSaveScore_Click);
            // 
            // tbAssignScore
            // 
            this.tbAssignScore.Location = new System.Drawing.Point(378, 63);
            this.tbAssignScore.Name = "tbAssignScore";
            this.tbAssignScore.Size = new System.Drawing.Size(52, 22);
            this.tbAssignScore.TabIndex = 3;
            // 
            // lblAssignmentScore
            // 
            this.lblAssignmentScore.AutoSize = true;
            this.lblAssignmentScore.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAssignmentScore.Location = new System.Drawing.Point(111, 65);
            this.lblAssignmentScore.Name = "lblAssignmentScore";
            this.lblAssignmentScore.Size = new System.Drawing.Size(219, 20);
            this.lblAssignmentScore.TabIndex = 2;
            this.lblAssignmentScore.Text = "Entet the assignment score:";
            // 
            // tbAssignNum
            // 
            this.tbAssignNum.Location = new System.Drawing.Point(378, 30);
            this.tbAssignNum.Name = "tbAssignNum";
            this.tbAssignNum.Size = new System.Drawing.Size(52, 22);
            this.tbAssignNum.TabIndex = 1;
            // 
            // lblAssignInfo
            // 
            this.lblAssignInfo.AutoSize = true;
            this.lblAssignInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAssignInfo.Location = new System.Drawing.Point(83, 32);
            this.lblAssignInfo.Name = "lblAssignInfo";
            this.lblAssignInfo.Size = new System.Drawing.Size(140, 20);
            this.lblAssignInfo.TabIndex = 0;
            this.lblAssignInfo.Text = "Enter assignment";
            // 
            // btnDisplayScore
            // 
            this.btnDisplayScore.Enabled = false;
            this.btnDisplayScore.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDisplayScore.Location = new System.Drawing.Point(314, 426);
            this.btnDisplayScore.Name = "btnDisplayScore";
            this.btnDisplayScore.Size = new System.Drawing.Size(135, 32);
            this.btnDisplayScore.TabIndex = 5;
            this.btnDisplayScore.Text = "Display Scores";
            this.btnDisplayScore.UseVisualStyleBackColor = true;
            this.btnDisplayScore.Click += new System.EventHandler(this.btnDisplayScore_Click);
            // 
            // rtbScores
            // 
            this.rtbScores.Location = new System.Drawing.Point(12, 464);
            this.rtbScores.Name = "rtbScores";
            this.rtbScores.Size = new System.Drawing.Size(907, 192);
            this.rtbScores.TabIndex = 6;
            this.rtbScores.Text = "";
            // 
            // Scores
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(931, 668);
            this.Controls.Add(this.rtbScores);
            this.Controls.Add(this.btnDisplayScore);
            this.Controls.Add(this.gbAssignmentInfo);
            this.Controls.Add(this.gbStudentName);
            this.Controls.Add(this.gbNav);
            this.Controls.Add(this.btnReset);
            this.Controls.Add(this.gbCounts);
            this.Name = "Scores";
            this.Text = "Scores";
            this.gbCounts.ResumeLayout(false);
            this.gbCounts.PerformLayout();
            this.gbNav.ResumeLayout(false);
            this.gbStudentName.ResumeLayout(false);
            this.gbStudentName.PerformLayout();
            this.gbAssignmentInfo.ResumeLayout(false);
            this.gbAssignmentInfo.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbCounts;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnSubmitCounts;
        private System.Windows.Forms.TextBox tbNumAssign;
        private System.Windows.Forms.TextBox tbNumStudents;
        private System.Windows.Forms.Label lblNumAssign;
        private System.Windows.Forms.Label lblNumStudents;
        private System.Windows.Forms.GroupBox gbNav;
        private System.Windows.Forms.Button btnLastStudent;
        private System.Windows.Forms.Button btnNextStudent;
        private System.Windows.Forms.Button btnPrevStudent;
        private System.Windows.Forms.Button btnFirstStudent;
        private System.Windows.Forms.GroupBox gbStudentName;
        private System.Windows.Forms.Button btnSaveName;
        private System.Windows.Forms.TextBox tbStudentName;
        private System.Windows.Forms.Label lblStudentName;
        private System.Windows.Forms.GroupBox gbAssignmentInfo;
        private System.Windows.Forms.Button btnSaveScore;
        private System.Windows.Forms.TextBox tbAssignScore;
        private System.Windows.Forms.Label lblAssignmentScore;
        private System.Windows.Forms.TextBox tbAssignNum;
        private System.Windows.Forms.Label lblAssignInfo;
        private System.Windows.Forms.Button btnDisplayScore;
        private System.Windows.Forms.RichTextBox rtbScores;
        private System.Windows.Forms.Label lblStudentError;
        private System.Windows.Forms.Label lblNumAssignError;
        private System.Windows.Forms.Label lblNumberStudentsError;
        private System.Windows.Forms.Label lblNumberAssignmentError;
    }
}

