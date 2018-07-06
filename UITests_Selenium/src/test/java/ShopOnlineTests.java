import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import static org.junit.jupiter.api.Assertions.*;

public class ShopOnlineTests {

    @Test
    public void login(){

        System.setProperty("webdriver.chrome.driver", "/Users/burda/Documents/ShopOnline/UITests_Selenium/chromedriver");
        WebDriver driver = new ChromeDriver();
        driver.get("http://localhost:8888");




        driver.close();
    }
}