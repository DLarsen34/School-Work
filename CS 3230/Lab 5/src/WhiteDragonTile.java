import java.awt.*;
import javax.swing.*;

public class WhiteDragonTile extends Tile
{
	public WhiteDragonTile()
	{
		setToolTipText(toString());
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		
		Graphics2D g2 = (Graphics2D)g;
		
		//Top Line
		g2.setColor(Color.BLACK);
		g2.fillRect(30, 10, 20, 5);
		g2.setColor(Color.BLUE);
		g2.fillRect(50, 10, 20, 5);
		g2.setColor(Color.BLACK);
		g2.fillRect(70, 10, 20, 5);
		g2.setColor(Color.BLUE);
		g2.fillRect(90, 10, 20, 5);
		
		//Right Side
		g2.setColor(Color.BLACK);
		g2.fillRect(105, 15, 5, 20);
		g2.setColor(Color.BLUE);
		g2.fillRect(105, 30, 5, 20);
		g2.setColor(Color.BLACK);
		g2.fillRect(105, 50, 5, 20);
		g2.setColor(Color.BLUE);
		g2.fillRect(105, 70, 5, 25);
		
		//Left Side
		g2.setColor(Color.BLUE);
		g2.fillRect(30, 10, 5, 20);
		g2.setColor(Color.BLACK);
		g2.fillRect(30, 30, 5, 20);
		g2.setColor(Color.BLUE);
		g2.fillRect(30, 50, 5, 20);
		g2.setColor(Color.BLACK);
		g2.fillRect(30, 70, 5, 20);
		
		//Bottom Line
		g2.setColor(Color.BLUE);
		g2.fillRect(30, 90, 20, 5);
		g2.setColor(Color.BLACK);
		g2.fillRect(50, 90, 20, 5);
		g2.setColor(Color.BLUE);
		g2.fillRect(70, 90, 20, 5);
		g2.setColor(Color.BLACK);
		g2.fillRect(90, 90, 20, 5);
	}


	public String toString()
	{
		return "White Dragon";
	}
	
	public static void main(String[] args)
	{
		JFrame	frame = new JFrame();

		frame.setLayout(new FlowLayout());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("White Dragon Tile");

		frame.add(new WhiteDragonTile());

		frame.pack();
		frame.setVisible(true);

	}
}
