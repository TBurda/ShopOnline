package cz.uhk.ppro.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Categories")
public class Category implements Serializable {

    private int id;
    private String name;

    public Category() {
    }

    public Category(String name) {
        this.name = name;
    }

    @Id
    @Column(name = "ID", nullable = false)
    public int getId() { return id; }

    @Column(name = "Name", length = 255, nullable = false)
    public String getName() {
        return name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
}
