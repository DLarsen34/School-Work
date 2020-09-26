public class Lock
{
	public boolean equals(Object other)
	{
		if (this == other || other == null)
			return false;
		if(getClass() == other.getClass())
			return true;
		return false;
	}
}
