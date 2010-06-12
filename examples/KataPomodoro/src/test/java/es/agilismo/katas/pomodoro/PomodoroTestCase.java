package es.agilismo.katas.pomodoro;

import junit.framework.TestCase;

public class PomodoroTestCase extends TestCase {

	private static final int ANY_NEGATIVE_DURATION = -45;
	private static final int ANY_POSITIVE_DURATION = 30;
	private static final int MINUTES_BY_DEFAULT = 25;

	public void testCreation() throws Exception {
		Pomodoro pomodoro = new Pomodoro();
		assertNotNull(pomodoro);
		assertEquals("Duración por defecto 25 minutos",MINUTES_BY_DEFAULT,pomodoro.minutesLeft());
		pomodoro = new Pomodoro(ANY_POSITIVE_DURATION);
		assertEquals("Pomodoro con cualquier duración",ANY_POSITIVE_DURATION,pomodoro.minutesLeft());
		pomodoro = new Pomodoro(ANY_NEGATIVE_DURATION);
		assertEquals("Duración negativa pomodoro por defecto ",MINUTES_BY_DEFAULT, pomodoro.minutesLeft());
		pomodoro = new Pomodoro(0);
		assertEquals("También duración cero", 0, pomodoro.minutesLeft());
	}
	
	public void testStartAndCount() throws Exception {
		Pomodoro pomodoro = new Pomodoro();
		assertFalse("Un pomodoro recién creado está parado",pomodoro.hasStarted());
		pomodoro.start();
		assertTrue("Los pomodoros los arrancan los usuarios",pomodoro.hasStarted());
		waitAMoment();
		assertEquals("Al arrancar un pomodoro comienza la cuenta atrás",24,pomodoro.minutesLeft());
		pomodoro = new Pomodoro(0);
		pomodoro.start();
		waitAMoment();
		assertEquals("Minutos restantes no pueden ser menos de 0",0,pomodoro.minutesLeft());
	}
	
	public void testEnd() throws Exception {
		Pomodoro pomodoro = new Pomodoro();
		assertFalse("Un pomodoro no termina si no ha arrancado",pomodoro.isFinished());
		pomodoro = new Pomodoro(0);
		pomodoro.start();
		waitAMoment();
		assertTrue("Un pomodoro acaba cuando se agota su tiempo",pomodoro.isFinished());
		pomodoro = new Pomodoro(1);
		pomodoro.start();
		waitAMoment();
		assertFalse("Un pomodoro no acaba mientras no se agote su tiempo",pomodoro.isFinished());
	}
	
	public void testInterruptions() throws Exception {
		Pomodoro pomodoro = new Pomodoro();
		assertEquals("Un pomodoro se inicia sin interrupciones",0,pomodoro.numberOfInterruptions());
		pomodoro.interrupt();
		assertEquals("Si no está arrancado, no se puede interrumpir",0,pomodoro.numberOfInterruptions());
		pomodoro.start();
		pomodoro.interrupt();
		assertEquals("Una vez arrancado, se puede interrumpir",1,pomodoro.numberOfInterruptions());
		pomodoro.interrupt();
		assertEquals("El pomodoro cuenta las interrupciones",2,pomodoro.numberOfInterruptions());
	}
	
	public void testRestart() throws Exception {
		Pomodoro pomodoro = new Pomodoro(ANY_POSITIVE_DURATION);
		pomodoro.start();
		waitAMoment();
		pomodoro.interrupt();
		pomodoro.start();
		assertEquals("Un pomodoro arrancado se resetea al arrancarlo de nuevo",ANY_POSITIVE_DURATION,pomodoro.minutesLeft());
		assertEquals("Un pomodoro se resetea sin interrupciones",0,pomodoro.numberOfInterruptions());
	}

	private void waitAMoment() {
		try {
			Thread.sleep(343);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
