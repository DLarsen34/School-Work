import java.awt.*;
import javax.swing.*;

public class Tile extends JPanel
{
    private static Dimension SIZE;
	private static Polygon SIDE1;
	private static Polygon SIDE2;
	private static Polygon BOTTOM1;
	private static Polygon BOTTOM2;
	private static Rectangle FACE;
	private static GradientPaint GRAD1;
	private static GradientPaint GRAD2;
	private static Color BOTTOM = new Color(0, 255, 0);
	private static Color TOP = new Color(0, 100, 0);
	private static Color FCOLOR1 = new Color(252, 245, 240);
	private static Color FCOLOR2 = new Color(225, 225, 225);
	
	public Tile()
	{
		setPreferredSize(SIZE);
		setSize(121, 121);
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		Graphics2D g2 = (Graphics2D)g;
		
		g2.setPaint(GRAD2);
		g2.fill(FACE);
		g2.setColor(Color.BLACK);
		g2.draw(FACE);
		
		g2.setPaint(GRAD2);
		g2.fill(SIDE1);
		g2.setColor(Color.BLACK);
		g2.draw(SIDE1);	
		
		g2.setPaint(GRAD1);
		g2.fill(SIDE2);
		g2.setColor(Color.BLACK);
		g2.draw(SIDE2);	
		
		g2.setPaint(GRAD2);
		g2.fill(BOTTOM1);
		g2.setColor(Color.BLACK);
		g2.draw(BOTTOM1);	
		
		g2.setPaint(GRAD1);
		g2.fill(BOTTOM2);
		g2.setColor(Color.BLACK);
		g2.draw(BOTTOM2);
	}

	static
	{
		SIZE = new Dimension(121, 121);
		
		FACE = new Rectangle(20, 0, 100, 100);
		SIDE1 = new Polygon(new int[] {10, 20, 20, 10}, new int[] {10, 0, 100, 110}, 4);
		SIDE2 = new Polygon(new int[] {0, 10, 10, 0}, new int[] {20, 10, 110, 120}, 4);
		BOTTOM1 = new Polygon(new int[] {10, 20, 120, 110}, new int[] {110, 100, 100, 110}, 4);
		BOTTOM2 = new Polygon(new int[] {0, 10, 110, 100}, new int[] {120, 110, 110, 120}, 4);
		
		GRAD1 = new GradientPaint(20, 100, BOTTOM, 120, 0, TOP);
		GRAD2 = new GradientPaint(20, 100, FCOLOR1, 120, 0, FCOLOR2);
	}

	public boolean matches(Tile other)
	{
		if(this == other || other == null)
			return false;
		if(getClass() == other.getClass())
			return true;
		return false;
	}
	
	public static void main(String[] args)
	{
		JFrame	frame = new JFrame();

		frame.setLayout(new FlowLayout());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Tile");

		frame.add(new Tile());

		frame.pack();
		frame.setVisible(true);
	}
}
