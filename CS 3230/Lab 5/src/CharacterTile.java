import java.util.*;
import java.awt.*;
import javax.swing.*;

public class CharacterTile extends Tile
{
	protected char symbol;
	private String wan = "\u842C";
	private static HashMap<Character, Character> map = new HashMap<>();
	static
	{
		map.put('1', '\u4E00');
		map.put('2', '\u4E8C');
		map.put('3', '\u4E09');
		map.put('4', '\u56DB');
		map.put('5', '\u4E94');
		map.put('6', '\u516D');
		map.put('7', '\u4E03');
		map.put('8', '\u516B');
		map.put('9', '\u4E5D');
		map.put('N', '\u5317');
		map.put('E', '\u6771');
		map.put('W', '\u897F');
		map.put('S', '\u5357');
		map.put('C', '\u4E2D');
		map.put('F', '\u767C');
	}
				
	public CharacterTile(char symbol)
	{
		this.symbol = symbol;
		setToolTipText(toString());
	}
	
	public boolean matches(Tile other)
	{
		return super.matches(other) && symbol == ((CharacterTile)other).symbol;
	}
	
	public String toString()
	{
		if(symbol == 'N')
			return "North Wind";
		else if(symbol == 'E')
			return "East Wind";
		else if(symbol == 'W')
			return "West Wind";
		else if(symbol == 'S')
			return "South Wind";
		else if(symbol == 'C')
			return "Red Dragon";
		else if(symbol == 'F')
			return "Green Dragon";
		else
			return "Character " + symbol;
	}
	
	public String toChinese()
	{
		String chinese = Character.toString(map.get(symbol));
		return chinese;
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		Font f = g.getFont().deriveFont(15F);
		g.setFont(f);
		g.setColor(Color.RED);
		g.drawString(String.valueOf(symbol), 100, 15);
		f = getFont().deriveFont(40F);
		g.setFont(f);
		//Draw wan symbol
		if(symbol == '1' || symbol == '2' || symbol == '3' || symbol == '4' || symbol == '5' || symbol == '6' || symbol == '7' || symbol == '8' || symbol == '9')
		{
			g.drawString(wan, 50, 90);
			g.setColor(Color.BLACK);
			g.drawString(map.get(symbol).toString(), 50, 40);
		}
		else if(symbol != 'C' && symbol != 'F')
		{
			f=getFont().deriveFont(70F);
			g.setFont(f);
			g.setColor(Color.BLACK);
			g.drawString(map.get(symbol).toString(), 35, 80);
		}
		else
		{
			f=getFont().deriveFont(70F);
			g.setFont(f);
			g.drawString(map.get(symbol).toString(), 35, 80);
		}
	}
	
	public static void main(String[] args)
	{
		JFrame		frame = new JFrame();
		JPanel		tiles = new JPanel();
		JScrollPane	scroller = new JScrollPane(tiles);

		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Character Tiles");
		frame.add(scroller);

		// Try something like this if your tiles don't fit on the screen.
		// Replace "tile width" and "tile height" with your values.
		//scroller.setPreferredSize(new Dimension(8 * tile width, 40 + tile height));

		tiles.add(new CharacterTile('1'));
		tiles.add(new CharacterTile('2'));
		tiles.add(new CharacterTile('3'));
		tiles.add(new CharacterTile('4'));
		tiles.add(new CharacterTile('5'));
		tiles.add(new CharacterTile('6'));
		tiles.add(new CharacterTile('7'));
		tiles.add(new CharacterTile('8'));
		tiles.add(new CharacterTile('9'));
		tiles.add(new CharacterTile('N'));
		tiles.add(new CharacterTile('E'));
		tiles.add(new CharacterTile('W'));
		tiles.add(new CharacterTile('S'));
		tiles.add(new CharacterTile('C'));
		tiles.add(new CharacterTile('F'));

		frame.pack();
		frame.setVisible(true);
	}
}
