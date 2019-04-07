package database;

public class bookItem {
    private int barCode;
    private boolean active;
    private int shelf;
    private int rack;
    private int idTitle;

    public bookItem(int barCode, boolean active, int shelf, int rack, int idTitle) {
        this.barCode = barCode;
        this.active = active;
        this.shelf = shelf;
        this.rack = rack;
        this.idTitle = idTitle;
    }

    public int getBarCode() {
        return barCode;
    }

    public void setBarCode(int barCode) {
        this.barCode = barCode;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getShelf() {
        return shelf;
    }

    public void setShelf(int shelf) {
        this.shelf = shelf;
    }

    public int getRack() {
        return rack;
    }

    public void setRack(int rack) {
        this.rack = rack;
    }

    public int getIdTitle() {
        return idTitle;
    }

    public void setIdTitle(int idTitle) {
        this.idTitle = idTitle;
    }
}
