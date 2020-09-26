import java.awt.*;
import javax.swing.*;

public class CircleTile extends RankTile
{
	private Circle[] circles;
	
	public CircleTile(int rank)
	{
		super(rank);
		setToolTipText(toString());
		circles = new Circle[rank];
		
		switch(rank)
		{
		case 1:
			circles[0] = new Pancake(52, 27, Color.BLACK);
			break;
		case 2:
			circles[0] = new Circle(55, 15, Color.RED);
			circles[1] = new Circle(55, 60, Color.GREEN);
			break;
		case 3:
			circles[0] = new Circle(30, 10, Color.BLUE);
			circles[1] = new Circle(60, 40, Color.RED);
			circles[2] = new Circle(90, 70, Color.GREEN);
			break;
		case 4:
			circles[0] = new Circle(40, 15, Color.BLUE);
			circles[1] = new Circle(40, 60, Color.GREEN);
			circles[2] = new Circle(80, 15, Color.GREEN);
			circles[3] = new Circle(80, 60, Color.BLUE);
			break;
		case 5:
			circles[0] = new Circle(30, 10, Color.BLUE);
			circles[1] = new Circle(60, 40, Color.RED);
			circles[2] = new Circle(90, 70, Color.BLUE);
			circles[3] = new Circle(30, 70, Color.GREEN);
			circles[4] = new Circle(90, 10, Color.GREEN);
			break;
		case 6:
			circles[0] = new Circle(40, 10, Color.GREEN);
			circles[1] = new Circle(80, 10, Color.GREEN);
			circles[2] = new Circle(40, 40, Color.RED);
			circles[3] = new Circle(80, 40, Color.RED);
			circles[4] = new Circle(40, 70, Color.RED);
			circles[5] = new Circle(80, 70, Color.RED);
			break;
		case 7:
			circles[0] = new Circle(30, 10, Color.GREEN);
			circles[1] = new Circle(60, 20, Color.GREEN);
			circles[2] = new Circle(90, 30, Color.GREEN);
			circles[3] = new Circle(40, 55, Color.RED);
			circles[4] = new Circle(40, 77, Color.RED);
			circles[5] = new Circle(80, 55, Color.RED);
			circles[6] = new Circle(80, 77, Color.RED);
			break;
		case 8:
			circles[0] = new Circle(40, 5, Color.BLUE);
			circles[1] = new Circle(80, 5, Color.BLUE);
			circles[2] = new Circle(40, 28, Color.BLUE);
			circles[3] = new Circle(80, 28, Color.BLUE);
			circles[4] = new Circle(40, 51, Color.BLUE);
			circles[5] = new Circle(80, 51, Color.BLUE);
			circles[6] = new Circle(40, 74, Color.BLUE);
			circles[7] = new Circle(80, 74, Color.BLUE);
			break;
		case 9:
			circles[0] = new Circle(30, 10, Color.GREEN);
			circles[1] = new Circle(60, 10, Color.GREEN);
			circles[2] = new Circle(90, 10, Color.GREEN);
			circles[3] = new Circle(30, 40, Color.RED);
			circles[4] = new Circle(60, 40, Color.RED);
			circles[5] = new Circle(90, 40, Color.RED);
			circles[6] = new Circle(30, 70, Color.BLUE);
			circles[7] = new Circle(60, 70, Color.BLUE);
			circles[8] = new Circle(90, 70, Color.BLUE);
			break;
		default:
			break;
		}
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		for (Circle c : circles)
			if (c != null)
				c.draw(g);
	}
	
	public String toString()
	{
		return "Circle " + rank;
	}
	
	//Inner class to draw the circles
	public class Circle
	{
		private int x;
		private int y;
		private Color c;
		public Circle(int x, int y, Color c)
		{
			this.x = x;
			this.y = y;
			this.c = c;
		}
		
		public void draw(Graphics g)
		{
			g.setColor(c);
			g.fillOval(x, y, 20, 20);
			
			String center = "X";
			Font f = g.getFont().deriveFont(15F);
			g.setFont(f);
			g.setColor(Color.WHITE);
			g.drawString(center, x+6, y+15);
		}
	}
	
	public class Pancake extends Circle
	{
		private int x;
		private int y;
		public Pancake(int x, int y, Color c)
		{
			super(x, y, c);
			this.x = x;
			this.y = y;
		}
		
		public void draw(Graphics g)
		{
			g.setColor(Color.GREEN);
			g.fillOval(30, 10, 80, 80);
			g.setColor(Color.WHITE);
			g.fillOval(65, 15, 10, 10); //top
			g.fillOval(80, 20, 10, 10);
			g.fillOval(90, 30, 10, 10);
			g.fillOval(95, 45, 10, 10); //right
			g.fillOval(90, 60, 10, 10);
			g.fillOval(80, 70, 10, 10);
			g.fillOval(65, 75, 10, 10); //bottom
			g.fillOval(50, 70, 10, 10);
			g.fillOval(40, 60, 10, 10);
			g.fillOval(35, 45, 10, 10); //left
			g.fillOval(40, 30, 10, 10);
			g.fillOval(50, 20, 10, 10);
			
			g.setColor(Color.RED);
			g.fillOval(60, 40, 20, 20);
			String center = "X";
			Font f = g.getFont().deriveFont(15F);
			g.setFont(f);
			g.setColor(Color.WHITE);
			g.drawString(center, x+14, y+29);
			g.drawOval(60, 40, 20, 20);
		}
	}

	public static void main(String[] args)
	{
		JFrame	frame = new JFrame();

		frame.setLayout(new FlowLayout());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Circle Tiles");

		frame.add(new CircleTile(1));
		frame.add(new CircleTile(2));
		frame.add(new CircleTile(3));
		frame.add(new CircleTile(4));
		frame.add(new CircleTile(5));
		frame.add(new CircleTile(6));
		frame.add(new CircleTile(7));
		frame.add(new CircleTile(8));
		frame.add(new CircleTile(9));

		frame.pack();
		frame.setVisible(true);
	}

}
