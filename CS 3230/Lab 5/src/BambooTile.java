import java.awt.*;
import javax.swing.*;

public class BambooTile extends RankTile
{	
	private Bamboo[] bamboos;
	
	public BambooTile(int rank)
	{
		super(rank);
		setToolTipText(toString());
		bamboos = new Bamboo[rank];
		
		switch(rank)
		{
		case 2:
			bamboos[0] = new Bamboo(60, 20, Color.BLUE);
			bamboos[1] = new Bamboo(60, 52, Color.GREEN);
			break;
		case 3:
			bamboos[0] = new Bamboo(60, 20, Color.BLUE);
			bamboos[1] = new Bamboo(40, 55, Color.GREEN);
			bamboos[2] = new Bamboo(80, 55, Color.GREEN);
			break;
		case 4:
			bamboos[0] = new Bamboo(40, 20, Color.BLUE);
			bamboos[1] = new Bamboo(40, 55, Color.GREEN);
			bamboos[2] = new Bamboo(80, 55, Color.BLUE);
			bamboos[3] = new Bamboo(80, 20, Color.GREEN);
			break;
		case 5:
			bamboos[0] = new Bamboo(30, 20, Color.GREEN);
			bamboos[1] = new Bamboo(30, 55, Color.BLUE);
			bamboos[2] = new Bamboo(90, 55, Color.GREEN);
			bamboos[3] = new Bamboo(90, 20, Color.BLUE);
			bamboos[4] = new Bamboo(60, 37, Color.RED);
			break;
		case 6:
			bamboos[0] = new Bamboo(30, 20, Color.GREEN);
			bamboos[1] = new Bamboo(60, 20, Color.GREEN);
			bamboos[2] = new Bamboo(90, 20, Color.GREEN);
			bamboos[3] = new Bamboo(30, 60, Color.BLUE);
			bamboos[4] = new Bamboo(60, 60, Color.BLUE);
			bamboos[5] = new Bamboo(90, 60, Color.BLUE);
			break;
		case 7:
			bamboos[0] = new Bamboo(60, 2, Color.RED);
			bamboos[1] = new Bamboo(60, 34, Color.BLUE);
			bamboos[2] = new Bamboo(60, 66, Color.BLUE);
			bamboos[3] = new Bamboo(30, 34, Color.GREEN);
			bamboos[4] = new Bamboo(90, 34, Color.GREEN);
			bamboos[5] = new Bamboo(30, 66, Color.GREEN);
			bamboos[6] = new Bamboo(90, 66, Color.GREEN);
			break;
		case 8:
			bamboos[0] = new Bamboo(30, 2, Color.GREEN);
			bamboos[1] = new Bamboo(60, 2, Color.GREEN);
			bamboos[2] = new Bamboo(90, 2, Color.GREEN);
			bamboos[3] = new Bamboo(45, 34, Color.RED);
			bamboos[4] = new Bamboo(75, 34, Color.RED);
			bamboos[5] = new Bamboo(30, 66, Color.BLUE);
			bamboos[6] = new Bamboo(60, 66, Color.BLUE);
			bamboos[7] = new Bamboo(90, 66, Color.BLUE);
			break;
		case 9:
			bamboos[0] = new Bamboo(30, 2, Color.RED);
			bamboos[1] = new Bamboo(60, 2, Color.BLUE);
			bamboos[2] = new Bamboo(90, 2, Color.GREEN);
			bamboos[3] = new Bamboo(30, 34, Color.RED);
			bamboos[4] = new Bamboo(60, 34, Color.BLUE);
			bamboos[5] = new Bamboo(90, 34, Color.GREEN);
			bamboos[6] = new Bamboo(30, 66, Color.RED);
			bamboos[7] = new Bamboo(60, 66, Color.BLUE);
			bamboos[8] = new Bamboo(90, 66, Color.GREEN);
			break;
		default:
			break;
		}
	}

	public String toString()
	{
		return "Bamboo " + rank;
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		
		for (Bamboo b : bamboos)
			if (b != null)
				b.draw(g);
	}
	
	public class Bamboo
	{
		private int x;
		private int y;
		private Color c;
		
		public Bamboo(int x, int y, Color c)
		{
			this.x = x;
			this.y = y;
			this.c = c;
		}
		
		public void draw(Graphics g)
		{
			g.setColor(c);
			g.fillRoundRect(x, y, 15, 5, 2, 2);
			g.fillRect(x+4, y, 7, 25);
			g.fillRoundRect(x, y+13, 15, 5, 2, 2);
			g.fillRoundRect(x, y+25, 15, 5, 2, 2);
			g.setColor(Color.WHITE);
			g.drawLine(x+7, y+3, x+7, y+25);
			g.setColor(c);
			g.fillRoundRect(x, y+13, 15, 5, 2, 2);
		}
	}
	
	public static void main(String[] args)
	{
		JFrame	frame = new JFrame();

		frame.setLayout(new FlowLayout());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Bamboo Tiles");

		frame.add(new BambooTile(2));
		frame.add(new BambooTile(3));
		frame.add(new BambooTile(4));
		frame.add(new BambooTile(5));
		frame.add(new BambooTile(6));
		frame.add(new BambooTile(7));
		frame.add(new BambooTile(8));
		frame.add(new BambooTile(9));

		frame.pack();
		frame.setVisible(true);
	}
}