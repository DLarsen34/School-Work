namespace Assignment4
{
    partial class Form1
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
            this.gbStats = new System.Windows.Forms.GroupBox();
            this.lblTies = new System.Windows.Forms.Label();
            this.lblPlayer2Wins = new System.Windows.Forms.Label();
            this.lblPlayer1Wins = new System.Windows.Forms.Label();
            this.btn00 = new System.Windows.Forms.Button();
            this.btn01 = new System.Windows.Forms.Button();
            this.btn02 = new System.Windows.Forms.Button();
            this.btn12 = new System.Windows.Forms.Button();
            this.btn11 = new System.Windows.Forms.Button();
            this.btn10 = new System.Windows.Forms.Button();
            this.btn22 = new System.Windows.Forms.Button();
            this.btn21 = new System.Windows.Forms.Button();
            this.btn20 = new System.Windows.Forms.Button();
            this.btnStart = new System.Windows.Forms.Button();
            this.gbGameStatus = new System.Windows.Forms.GroupBox();
            this.lblStatus = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.lblb1 = new System.Windows.Forms.Label();
            this.gbStats.SuspendLayout();
            this.gbGameStatus.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbStats
            // 
            this.gbStats.BackColor = System.Drawing.SystemColors.Control;
            this.gbStats.Controls.Add(this.lblTies);
            this.gbStats.Controls.Add(this.lblPlayer2Wins);
            this.gbStats.Controls.Add(this.lblPlayer1Wins);
            this.gbStats.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbStats.Location = new System.Drawing.Point(549, 143);
            this.gbStats.Name = "gbStats";
            this.gbStats.Size = new System.Drawing.Size(238, 191);
            this.gbStats.TabIndex = 0;
            this.gbStats.TabStop = false;
            this.gbStats.Text = "Statistics";
            // 
            // lblTies
            // 
            this.lblTies.AutoSize = true;
            this.lblTies.Location = new System.Drawing.Point(78, 140);
            this.lblTies.Name = "lblTies";
            this.lblTies.Size = new System.Drawing.Size(51, 20);
            this.lblTies.TabIndex = 2;
            this.lblTies.Text = "Ties: ";
            // 
            // lblPlayer2Wins
            // 
            this.lblPlayer2Wins.AutoSize = true;
            this.lblPlayer2Wins.Location = new System.Drawing.Point(6, 94);
            this.lblPlayer2Wins.Name = "lblPlayer2Wins";
            this.lblPlayer2Wins.Size = new System.Drawing.Size(123, 20);
            this.lblPlayer2Wins.TabIndex = 1;
            this.lblPlayer2Wins.Text = "Player 2 Wins: ";
            // 
            // lblPlayer1Wins
            // 
            this.lblPlayer1Wins.AutoSize = true;
            this.lblPlayer1Wins.Location = new System.Drawing.Point(6, 45);
            this.lblPlayer1Wins.Name = "lblPlayer1Wins";
            this.lblPlayer1Wins.Size = new System.Drawing.Size(123, 20);
            this.lblPlayer1Wins.TabIndex = 0;
            this.lblPlayer1Wins.Text = "Player 1 Wins: ";
            // 
            // btn00
            // 
            this.btn00.BackColor = System.Drawing.Color.Aqua;
            this.btn00.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn00.Enabled = false;
            this.btn00.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btn00.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn00.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn00.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn00.Location = new System.Drawing.Point(32, 28);
            this.btn00.Name = "btn00";
            this.btn00.Size = new System.Drawing.Size(133, 135);
            this.btn00.TabIndex = 1;
            this.btn00.UseVisualStyleBackColor = false;
            this.btn00.Click += new System.EventHandler(this.boardClick);
            // 
            // btn01
            // 
            this.btn01.BackColor = System.Drawing.Color.Aqua;
            this.btn01.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn01.Enabled = false;
            this.btn01.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btn01.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn01.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn01.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn01.Location = new System.Drawing.Point(187, 28);
            this.btn01.Name = "btn01";
            this.btn01.Size = new System.Drawing.Size(133, 135);
            this.btn01.TabIndex = 2;
            this.btn01.UseVisualStyleBackColor = false;
            this.btn01.Click += new System.EventHandler(this.boardClick);
            // 
            // btn02
            // 
            this.btn02.BackColor = System.Drawing.Color.Aqua;
            this.btn02.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn02.Enabled = false;
            this.btn02.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.btn02.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn02.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn02.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn02.Location = new System.Drawing.Point(343, 28);
            this.btn02.Name = "btn02";
            this.btn02.Size = new System.Drawing.Size(133, 135);
            this.btn02.TabIndex = 3;
            this.btn02.UseVisualStyleBackColor = false;
            this.btn02.Click += new System.EventHandler(this.boardClick);
            // 
            // btn12
            // 
            this.btn12.BackColor = System.Drawing.Color.Aqua;
            this.btn12.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn12.Enabled = false;
            this.btn12.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn12.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn12.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn12.Location = new System.Drawing.Point(343, 185);
            this.btn12.Name = "btn12";
            this.btn12.Size = new System.Drawing.Size(133, 135);
            this.btn12.TabIndex = 6;
            this.btn12.UseVisualStyleBackColor = false;
            this.btn12.Click += new System.EventHandler(this.boardClick);
            // 
            // btn11
            // 
            this.btn11.BackColor = System.Drawing.Color.Aqua;
            this.btn11.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn11.Enabled = false;
            this.btn11.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn11.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn11.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn11.Location = new System.Drawing.Point(187, 185);
            this.btn11.Name = "btn11";
            this.btn11.Size = new System.Drawing.Size(133, 135);
            this.btn11.TabIndex = 5;
            this.btn11.UseVisualStyleBackColor = false;
            this.btn11.Click += new System.EventHandler(this.boardClick);
            // 
            // btn10
            // 
            this.btn10.BackColor = System.Drawing.Color.Aqua;
            this.btn10.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn10.Enabled = false;
            this.btn10.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn10.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn10.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn10.Location = new System.Drawing.Point(32, 185);
            this.btn10.Name = "btn10";
            this.btn10.Size = new System.Drawing.Size(133, 135);
            this.btn10.TabIndex = 4;
            this.btn10.UseVisualStyleBackColor = false;
            this.btn10.Click += new System.EventHandler(this.boardClick);
            // 
            // btn22
            // 
            this.btn22.BackColor = System.Drawing.Color.Aqua;
            this.btn22.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn22.Enabled = false;
            this.btn22.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn22.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn22.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn22.Location = new System.Drawing.Point(343, 342);
            this.btn22.Name = "btn22";
            this.btn22.Size = new System.Drawing.Size(133, 135);
            this.btn22.TabIndex = 9;
            this.btn22.UseVisualStyleBackColor = false;
            this.btn22.Click += new System.EventHandler(this.boardClick);
            // 
            // btn21
            // 
            this.btn21.BackColor = System.Drawing.Color.Aqua;
            this.btn21.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn21.Enabled = false;
            this.btn21.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn21.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn21.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn21.Location = new System.Drawing.Point(187, 342);
            this.btn21.Name = "btn21";
            this.btn21.Size = new System.Drawing.Size(133, 135);
            this.btn21.TabIndex = 8;
            this.btn21.UseVisualStyleBackColor = false;
            this.btn21.Click += new System.EventHandler(this.boardClick);
            // 
            // btn20
            // 
            this.btn20.BackColor = System.Drawing.Color.Aqua;
            this.btn20.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn20.Enabled = false;
            this.btn20.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Blue;
            this.btn20.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn20.Font = new System.Drawing.Font("Microsoft Sans Serif", 60F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn20.Location = new System.Drawing.Point(32, 342);
            this.btn20.Name = "btn20";
            this.btn20.Size = new System.Drawing.Size(133, 135);
            this.btn20.TabIndex = 7;
            this.btn20.UseVisualStyleBackColor = false;
            this.btn20.Click += new System.EventHandler(this.boardClick);
            // 
            // btnStart
            // 
            this.btnStart.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btnStart.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnStart.Location = new System.Drawing.Point(549, 65);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(129, 39);
            this.btnStart.TabIndex = 14;
            this.btnStart.Text = "Start Game";
            this.btnStart.UseVisualStyleBackColor = false;
            this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
            // 
            // gbGameStatus
            // 
            this.gbGameStatus.BackColor = System.Drawing.SystemColors.Control;
            this.gbGameStatus.Controls.Add(this.lblStatus);
            this.gbGameStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbGameStatus.Location = new System.Drawing.Point(32, 518);
            this.gbGameStatus.Name = "gbGameStatus";
            this.gbGameStatus.Size = new System.Drawing.Size(331, 100);
            this.gbGameStatus.TabIndex = 15;
            this.gbGameStatus.TabStop = false;
            this.gbGameStatus.Text = "Game Status";
            // 
            // lblStatus
            // 
            this.lblStatus.AutoSize = true;
            this.lblStatus.Location = new System.Drawing.Point(11, 40);
            this.lblStatus.Name = "lblStatus";
            this.lblStatus.Size = new System.Drawing.Size(137, 20);
            this.lblStatus.TabIndex = 0;
            this.lblStatus.Text = "Click Start Game";
            // 
            // label3
            // 
            this.label3.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.label3.Location = new System.Drawing.Point(319, 9);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(34, 490);
            this.label3.TabIndex = 13;
            this.label3.Text = "label3";
            // 
            // label2
            // 
            this.label2.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.label2.Location = new System.Drawing.Point(160, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 490);
            this.label2.TabIndex = 12;
            this.label2.Text = "label2";
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.label1.Location = new System.Drawing.Point(13, 307);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(485, 36);
            this.label1.TabIndex = 11;
            this.label1.Text = "label1";
            // 
            // lblb1
            // 
            this.lblb1.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.lblb1.Location = new System.Drawing.Point(13, 159);
            this.lblb1.Name = "lblb1";
            this.lblb1.Size = new System.Drawing.Size(485, 32);
            this.lblb1.TabIndex = 10;
            this.lblb1.Text = "label1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.ClientSize = new System.Drawing.Size(819, 647);
            this.Controls.Add(this.gbGameStatus);
            this.Controls.Add(this.btnStart);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lblb1);
            this.Controls.Add(this.btn22);
            this.Controls.Add(this.btn21);
            this.Controls.Add(this.btn20);
            this.Controls.Add(this.btn12);
            this.Controls.Add(this.btn11);
            this.Controls.Add(this.btn10);
            this.Controls.Add(this.btn02);
            this.Controls.Add(this.btn01);
            this.Controls.Add(this.btn00);
            this.Controls.Add(this.gbStats);
            this.Name = "Form1";
            this.Text = "TicTacToe";
            this.gbStats.ResumeLayout(false);
            this.gbStats.PerformLayout();
            this.gbGameStatus.ResumeLayout(false);
            this.gbGameStatus.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbStats;
        private System.Windows.Forms.Label lblPlayer1Wins;
        private System.Windows.Forms.Label lblTies;
        private System.Windows.Forms.Label lblPlayer2Wins;
        private System.Windows.Forms.Button btn00;
        private System.Windows.Forms.Button btn01;
        private System.Windows.Forms.Button btn02;
        private System.Windows.Forms.Button btn12;
        private System.Windows.Forms.Button btn11;
        private System.Windows.Forms.Button btn10;
        private System.Windows.Forms.Button btn22;
        private System.Windows.Forms.Button btn21;
        private System.Windows.Forms.Button btn20;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.GroupBox gbGameStatus;
        private System.Windows.Forms.Label lblStatus;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblb1;
    }
}

