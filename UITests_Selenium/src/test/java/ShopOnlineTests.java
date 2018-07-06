import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import static org.junit.Assert.*;

public class ShopOnlineTests {

    @Test
    public void login() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver", "/Users/burda/Documents/ShopOnline/UITests_Selenium/chromedriver");
        WebDriver driver = new ChromeDriver();
        driver.get("http://localhost:8888");

        driver.findElement(By.id("login")).click();

        driver.findElement(By.id("inputEmail3")).clear();
        driver.findElement(By.id("inputEmail3")).sendKeys("manager1");

        driver.findElement(By.id("inputPassword3")).clear();
        driver.findElement(By.id("inputPassword3")).sendKeys("123");

        driver.findElement(By.id("submit")).click();

        Thread.sleep(1000);
        WebElement info = driver.findElement(By.className("callout-success"));
        assertTrue(info.isDisplayed());

        driver.close();
    }
}