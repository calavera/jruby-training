package es.agilismo.katas.pomodoro;

public class Pomodoro {

	private static final int MILLISECONDS_IN_A_MINUTE = 60000;
	private static final int MINUTES_BY_DEFAULT = 25;
	private int duracion;
	private boolean hasStarted;
	private double timeStarted;
	private int numberOfInterruptions;

	public Pomodoro() {
		this(MINUTES_BY_DEFAULT);
	}

	public Pomodoro(int duracion) {
		this.hasStarted = false;
		this.duracion = duracion;
		if (this.duracion < 0) {
			this.duracion = MINUTES_BY_DEFAULT;
		}
	}

	public int minutesLeft() {
		int minutesLeft = duracion;
		
		if(!this.hasStarted()){
			return minutesLeft;
		}
		
		double millisLeft = millisLeft();
		minutesLeft = milisegundosAMinutos( millisLeft);
		return minutesLeft;
	}

	private double millisLeft() {
		double diferenciaTemporalEnMilisegundos = calculaDiferenciaTemporal();
		int duracionEnMilisegundos = duracion*MILLISECONDS_IN_A_MINUTE;
		return duracionEnMilisegundos - diferenciaTemporalEnMilisegundos;
	}

	private int milisegundosAMinutos(double diferenciaTemporal) {
		return (int) (diferenciaTemporal / MILLISECONDS_IN_A_MINUTE);
	}

	private double calculaDiferenciaTemporal() {
		return System.currentTimeMillis() - this.timeStarted;
	}
	
	public boolean hasStarted() {
		return this.hasStarted;
	}

	public void start() {
		this.hasStarted = true;
		this.timeStarted = System.currentTimeMillis();		
		this.numberOfInterruptions = 0;
	}

	public boolean isFinished() {
		boolean finished = false;
		boolean timeExpired = (millisLeft() <= 0);
		if ( hasStarted() && timeExpired ) {
			finished = true;
		}
		return finished;
	}

	public int numberOfInterruptions() {
		return numberOfInterruptions;
	}

	public void interrupt() {
		if (hasStarted()) {
			this.numberOfInterruptions++;			
		}
	}
	

}
