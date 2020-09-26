namespace Assignment5
{
    partial class MainMenu
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainMenu));
            this.lblName = new System.Windows.Forms.Label();
            this.tbName = new System.Windows.Forms.TextBox();
            this.tbAge = new System.Windows.Forms.TextBox();
            this.lblAge = new System.Windows.Forms.Label();
            this.gbGameType = new System.Windows.Forms.GroupBox();
            this.rbDivision = new System.Windows.Forms.RadioButton();
            this.rbMultiplication = new System.Windows.Forms.RadioButton();
            this.rbSubtraction = new System.Windows.Forms.RadioButton();
            this.rbAddition = new System.Windows.Forms.RadioButton();
            this.btnBegin = new System.Windows.Forms.Button();
            this.lblNameErr = new System.Windows.Forms.Label();
            this.lblGameErr = new System.Windows.Forms.Label();
            this.lblAgeErr = new System.Windows.Forms.Label();
            this.gbGameType.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.BackColor = System.Drawing.Color.Transparent;
            this.lblName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblName.ForeColor = System.Drawing.Color.DimGray;
            this.lblName.Location = new System.Drawing.Point(12, 18);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(167, 25);
            this.lblName.TabIndex = 0;
            this.lblName.Text = "Enter Your Name:";
            // 
            // tbName
            // 
            this.tbName.Location = new System.Drawing.Point(196, 21);
            this.tbName.Name = "tbName";
            this.tbName.Size = new System.Drawing.Size(100, 22);
            this.tbName.TabIndex = 1;
            // 
            // tbAge
            // 
            this.tbAge.Location = new System.Drawing.Point(196, 69);
            this.tbAge.MaxLength = 2;
            this.tbAge.Name = "tbAge";
            this.tbAge.Size = new System.Drawing.Size(100, 22);
            this.tbAge.TabIndex = 3;
            // 
            // lblAge
            // 
            this.lblAge.AutoSize = true;
            this.lblAge.BackColor = System.Drawing.Color.Transparent;
            this.lblAge.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAge.ForeColor = System.Drawing.Color.DimGray;
            this.lblAge.Location = new System.Drawing.Point(12, 65);
            this.lblAge.Name = "lblAge";
            this.lblAge.Size = new System.Drawing.Size(151, 25);
            this.lblAge.TabIndex = 2;
            this.lblAge.Text = "Enter Your Age:";
            // 
            // gbGameType
            // 
            this.gbGameType.BackColor = System.Drawing.Color.Transparent;
            this.gbGameType.Controls.Add(this.rbDivision);
            this.gbGameType.Controls.Add(this.rbMultiplication);
            this.gbGameType.Controls.Add(this.rbSubtraction);
            this.gbGameType.Controls.Add(this.rbAddition);
            this.gbGameType.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbGameType.ForeColor = System.Drawing.Color.White;
            this.gbGameType.Location = new System.Drawing.Point(17, 163);
            this.gbGameType.Name = "gbGameType";
            this.gbGameType.Size = new System.Drawing.Size(279, 219);
            this.gbGameType.TabIndex = 4;
            this.gbGameType.TabStop = false;
            this.gbGameType.Text = "Game Choice";
            // 
            // rbDivision
            // 
            this.rbDivision.AutoSize = true;
            this.rbDivision.Location = new System.Drawing.Point(21, 173);
            this.rbDivision.Name = "rbDivision";
            this.rbDivision.Size = new System.Drawing.Size(101, 29);
            this.rbDivision.TabIndex = 3;
            this.rbDivision.TabStop = true;
            this.rbDivision.Text = "Division";
            this.rbDivision.UseVisualStyleBackColor = true;
            // 
            // rbMultiplication
            // 
            this.rbMultiplication.AutoSize = true;
            this.rbMultiplication.Location = new System.Drawing.Point(21, 125);
            this.rbMultiplication.Name = "rbMultiplication";
            this.rbMultiplication.Size = new System.Drawing.Size(145, 29);
            this.rbMultiplication.TabIndex = 2;
            this.rbMultiplication.TabStop = true;
            this.rbMultiplication.Text = "Multiplication";
            this.rbMultiplication.UseVisualStyleBackColor = true;
            // 
            // rbSubtraction
            // 
            this.rbSubtraction.AutoSize = true;
            this.rbSubtraction.Location = new System.Drawing.Point(21, 78);
            this.rbSubtraction.Name = "rbSubtraction";
            this.rbSubtraction.Size = new System.Drawing.Size(132, 29);
            this.rbSubtraction.TabIndex = 1;
            this.rbSubtraction.TabStop = true;
            this.rbSubtraction.Text = "Subtraction";
            this.rbSubtraction.UseVisualStyleBackColor = true;
            // 
            // rbAddition
            // 
            this.rbAddition.AutoSize = true;
            this.rbAddition.Location = new System.Drawing.Point(21, 30);
            this.rbAddition.Name = "rbAddition";
            this.rbAddition.Size = new System.Drawing.Size(104, 29);
            this.rbAddition.TabIndex = 0;
            this.rbAddition.TabStop = true;
            this.rbAddition.Text = "Addition";
            this.rbAddition.UseVisualStyleBackColor = true;
            // 
            // btnBegin
            // 
            this.btnBegin.BackColor = System.Drawing.Color.Transparent;
            this.btnBegin.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBegin.ForeColor = System.Drawing.Color.Black;
            this.btnBegin.Location = new System.Drawing.Point(409, 336);
            this.btnBegin.Name = "btnBegin";
            this.btnBegin.Size = new System.Drawing.Size(179, 65);
            this.btnBegin.TabIndex = 5;
            this.btnBegin.Text = "Begin Game";
            this.btnBegin.UseVisualStyleBackColor = false;
            this.btnBegin.Click += new System.EventHandler(this.btnBegin_Click);
            // 
            // lblNameErr
            // 
            this.lblNameErr.AutoSize = true;
            this.lblNameErr.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNameErr.ForeColor = System.Drawing.Color.Red;
            this.lblNameErr.Location = new System.Drawing.Point(331, 49);
            this.lblNameErr.Name = "lblNameErr";
            this.lblNameErr.Size = new System.Drawing.Size(0, 25);
            this.lblNameErr.TabIndex = 6;
            // 
            // lblGameErr
            // 
            this.lblGameErr.AutoSize = true;
            this.lblGameErr.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblGameErr.ForeColor = System.Drawing.Color.Red;
            this.lblGameErr.Location = new System.Drawing.Point(326, 176);
            this.lblGameErr.Name = "lblGameErr";
            this.lblGameErr.Size = new System.Drawing.Size(0, 25);
            this.lblGameErr.TabIndex = 7;
            // 
            // lblAgeErr
            // 
            this.lblAgeErr.AutoSize = true;
            this.lblAgeErr.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAgeErr.ForeColor = System.Drawing.Color.Red;
            this.lblAgeErr.Location = new System.Drawing.Point(331, 104);
            this.lblAgeErr.Name = "lblAgeErr";
            this.lblAgeErr.Size = new System.Drawing.Size(0, 25);
            this.lblAgeErr.TabIndex = 8;
            // 
            // MainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(681, 429);
            this.Controls.Add(this.lblAgeErr);
            this.Controls.Add(this.lblGameErr);
            this.Controls.Add(this.lblNameErr);
            this.Controls.Add(this.btnBegin);
            this.Controls.Add(this.gbGameType);
            this.Controls.Add(this.tbAge);
            this.Controls.Add(this.lblAge);
            this.Controls.Add(this.tbName);
            this.Controls.Add(this.lblName);
            this.Name = "MainMenu";
            this.Text = "Main Menu";
            this.gbGameType.ResumeLayout(false);
            this.gbGameType.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.TextBox tbName;
        private System.Windows.Forms.TextBox tbAge;
        private System.Windows.Forms.Label lblAge;
        private System.Windows.Forms.GroupBox gbGameType;
        private System.Windows.Forms.RadioButton rbDivision;
        private System.Windows.Forms.RadioButton rbMultiplication;
        private System.Windows.Forms.RadioButton rbSubtraction;
        private System.Windows.Forms.RadioButton rbAddition;
        private System.Windows.Forms.Button btnBegin;
        private System.Windows.Forms.Label lblNameErr;
        private System.Windows.Forms.Label lblGameErr;
        private System.Windows.Forms.Label lblAgeErr;
    }
}

