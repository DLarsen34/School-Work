namespace Assignment1Part1
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
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.cmdSubmit1 = new System.Windows.Forms.Button();
            this.cmdSubmit2 = new System.Windows.Forms.Button();
            this.cmdSubmit3 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(14, 26);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 22);
            this.textBox1.TabIndex = 0;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(14, 85);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 22);
            this.textBox2.TabIndex = 1;
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(14, 144);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(100, 22);
            this.textBox3.TabIndex = 2;
            // 
            // cmdSubmit1
            // 
            this.cmdSubmit1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.cmdSubmit1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdSubmit1.Location = new System.Drawing.Point(147, 25);
            this.cmdSubmit1.Name = "cmdSubmit1";
            this.cmdSubmit1.Size = new System.Drawing.Size(93, 31);
            this.cmdSubmit1.TabIndex = 3;
            this.cmdSubmit1.Text = "Submit";
            this.cmdSubmit1.UseVisualStyleBackColor = false;
            this.cmdSubmit1.Click += new System.EventHandler(this.cmdSubmit1_Click);
            // 
            // cmdSubmit2
            // 
            this.cmdSubmit2.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.cmdSubmit2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdSubmit2.Location = new System.Drawing.Point(147, 83);
            this.cmdSubmit2.Name = "cmdSubmit2";
            this.cmdSubmit2.Size = new System.Drawing.Size(93, 30);
            this.cmdSubmit2.TabIndex = 4;
            this.cmdSubmit2.Text = "Submit";
            this.cmdSubmit2.UseVisualStyleBackColor = false;
            this.cmdSubmit2.Click += new System.EventHandler(this.cmdSubmit2_Click);
            // 
            // cmdSubmit3
            // 
            this.cmdSubmit3.BackColor = System.Drawing.SystemColors.Info;
            this.cmdSubmit3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdSubmit3.Location = new System.Drawing.Point(147, 142);
            this.cmdSubmit3.Name = "cmdSubmit3";
            this.cmdSubmit3.Size = new System.Drawing.Size(93, 29);
            this.cmdSubmit3.TabIndex = 5;
            this.cmdSubmit3.Text = "Submit";
            this.cmdSubmit3.UseVisualStyleBackColor = false;
            this.cmdSubmit3.Click += new System.EventHandler(this.cmdSubmit3_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(278, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(335, 25);
            this.label1.TabIndex = 6;
            this.label1.Text = "Will display the text in the top textbox.";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(278, 89);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(365, 25);
            this.label2.TabIndex = 7;
            this.label2.Text = "Will display the text in the middle textbox.";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(278, 149);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(367, 25);
            this.label3.TabIndex = 8;
            this.label3.Text = "Will display the text in the bottom textbox.";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(259, 253);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(0, 25);
            this.label4.TabIndex = 9;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(690, 420);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmdSubmit3);
            this.Controls.Add(this.cmdSubmit2);
            this.Controls.Add(this.cmdSubmit1);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.Button cmdSubmit1;
        private System.Windows.Forms.Button cmdSubmit2;
        private System.Windows.Forms.Button cmdSubmit3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
    }
}

