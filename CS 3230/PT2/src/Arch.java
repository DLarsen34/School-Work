import java.awt.*;
import javax.swing.*;
import java.net.*;
import java.awt.event.*;

public class Arch extends JFrame
{
	private ImageIcon image;
	
	public Arch()
	{
		setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
		addWindowListener(new WindowAdapter()
		{ public void windowClosing(WindowEvent E)
			{ close(); }
		});

		
		Dimension	screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		try
		{
			URL url = new URL("https://www.nps.gov/arch/learn/photosmultimedia/upload/arches3.jpg");
			image = new ImageIcon(url);	
		}
		catch(MalformedURLException murle)
		{
			JOptionPane.showMessageDialog(this, "Bad URL: " + murle,
				"Image Error", JOptionPane.ERROR_MESSAGE);
		}
		
		add(new Display());
		pack();
		setLocation((screenSize.width - getWidth()) / 2, (screenSize.height - getHeight()) / 2);
		setVisible(true);
	}
	
	public void close()
	{
		System.exit(0);
	}
	
	class Display extends JPanel
	{
		public Display()
		{
			setPreferredSize(new Dimension(image.getIconWidth() + 50,image.getIconHeight() + 80));
		}
		
		public void paintComponent(Graphics g)
		{
			super.paintComponent(g);
			g.setColor(Color.BLUE);
			g.fillRect(0, 0, 425, 335);
			image.paintIcon(this, g, 25, 25);
			
			String caption = "Delicate Arch";
			Font	f = g.getFont().deriveFont(20F);
			g.setFont(f);
			FontMetrics	fm = g.getFontMetrics();
			int	wid = fm.stringWidth(caption);
			g.setColor(Color.RED);
			g.drawString(caption, (getWidth() - wid) / 2, getHeight() - 10);
		}
	}
	public static void main(String[] args)
	{
		new Arch();
	}
}
