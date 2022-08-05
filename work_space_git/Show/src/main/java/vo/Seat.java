package vo;

public class Seat {
	private String name;
	private int cost;
	public Seat() {
		super();
	}
	public Seat(String name, int cost) {
		super();
		this.name = name;
		this.cost = cost;
	}
	@Override
	public String toString() {
		return "Seat [name=" + name + ", cost=" + cost + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	
}   
	  