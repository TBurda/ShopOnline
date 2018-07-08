import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.List;

import static org.junit.Assert.*;

public class ShopOnlineTests {

    public static WebDriver driver;

    @BeforeAll
    public static void beforeAll() throws InterruptedException {

        System.setProperty("webdriver.chrome.driver", "/Users/burda/Documents/ShopOnline/UITests_Selenium/chromedriver");
        driver = new ChromeDriver();

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
    }

    @Test
    public void edit() {

        driver.get("http://localhost:8888/productList");

        List<WebElement> products = driver.findElements(By.id("edit"));
        products.get(0).click();

        WebElement btn_delete = driver.findElement(By.id("save"));
        assertTrue(btn_delete.isDisplayed());
    }

    @Test
    public void buy() {

        driver.get("http://localhost:8888/productList");

        List<WebElement> products = driver.findElements(By.id("buy"));
        products.get(0).click();

        WebElement btn_delete = driver.findElement(By.id("delete"));
        assertTrue(btn_delete.isDisplayed());
    }

    @Test
    public void orderList() {

        driver.get("http://localhost:8888/orderList");

        List<WebElement> products = driver.findElements(By.id("view"));
        products.get(0).click();

        WebElement btn_delete = driver.findElement(By.id("example2"));
        assertTrue(btn_delete.isDisplayed());
    }

    @Test
    public void customerInfo() throws InterruptedException {

        driver.get("http://localhost:8888/productList");

        List<WebElement> products = driver.findElements(By.id("buy"));
        products.get(0).click();

        driver.findElement(By.id("enter_customer_info")).click();

        driver.findElement(By.id("name")).clear();
        driver.findElement(By.id("name")).sendKeys("Tomas Burda");
        driver.findElement(By.id("email")).clear();
        driver.findElement(By.id("email")).sendKeys("t.burda@gmail.com");
        driver.findElement(By.id("phone")).clear();
        driver.findElement(By.id("phone")).sendKeys("677555677");
        driver.findElement(By.id("address")).clear();
        driver.findElement(By.id("address")).sendKeys("Vysoke Veseli");

        driver.findElement(By.id("save")).click();
        assertTrue(driver.findElement(By.className("img-responsive")).isDisplayed());
    }

    @AfterAll
    public static void afterAll() {

        driver.close();
    }
}