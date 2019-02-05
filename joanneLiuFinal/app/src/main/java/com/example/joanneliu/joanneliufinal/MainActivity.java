package com.example.joanneliu.joanneliufinal;

import android.app.Activity;
import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void bakePizza (View view){

        //TOGGLE FOR SAUCE
        ToggleButton toggle = findViewById(R.id.toggleButton);
        boolean sauce = toggle.isChecked();
        String rw;
        if(sauce){
            rw = "red sauce, ";
        }
        else {
            rw= "white sauce, ";
        }

        //SPINNER FOR SIZE
        Spinner size = findViewById(R.id.spinner);
        String sizeString = String.valueOf(size.getSelectedItem());
        String sz = new String();
       switch (sizeString){
           case("small"):
               sz = "small";
               break;
           case ("medium"):
               sz = "medium";
               break;
           case ("large"):
               sz = "large";
               break;
       }

       //RADIO GROUP FOR CRUST --also end of sentence
        RadioGroup crust = findViewById(R.id.radioGroup);
        int crustType = crust.getCheckedRadioButtonId();
        String crst;
        String suggest;
        if (crustType == R.id.radioButton1){
            crst = "on a thin crust, yummy.";
            suggest = " I recommend ordering from Pizzaria Locale!";
        }
        else if(crustType == R.id.radioButton2){
            crst = "on a thick crust, carb-y!";
            suggest = " I recommend ordering from Old Chicago!";
        }
        else {
            crst = ", yum.";
            suggest = " I recommend ordering from Cosmos!";
        }

        //CHECK BOXES FOR TOPPINGS
        CheckBox cheese = findViewById(R.id.checkBox1);
        Boolean cheeseBool = cheese.isChecked();
        CheckBox veggie = findViewById(R.id.checkBox2);
        Boolean vegBool = veggie.isChecked();
        CheckBox meat = findViewById(R.id.checkBox3);
        Boolean meatBool = meat.isChecked();
        CheckBox sup = findViewById(R.id.checkBox4);
        Boolean supBool = sup.isChecked();
        String topping = new String();
        String cheeseS = new String();
        ImageView img = (ImageView)findViewById(R.id.imageView);

        if (cheeseBool == true){
            cheeseS = "cheese, ";
            img.setImageResource(R.drawable.pizza_cheese);
        }
        else if (meatBool == true && vegBool == true){
            topping = "and supreme toppings ";
            img.setImageResource(R.drawable.pizza_supreme);
        }
        else if(vegBool == true){
            topping = " and veggie toppings ";
            img.setImageResource(R.drawable.pizza_veggie);

        }
        else if(meatBool == true){
            topping = "and meat toppings ";
            img.setImageResource(R.drawable.pizza_meat);

        }
        else if(supBool == true){
            topping = " and supreme toppings ";
            img.setImageResource(R.drawable.pizza_supreme);

        }
        else {
            topping = "and no toppings ";
            img.setImageResource(R.drawable.pizza_cheese);
        }


        //RETRIEVE USER NAME
        EditText name = (EditText) findViewById(R.id.editText);
        String nameValue = name.getText().toString();
        if (nameValue.equals("Annonymous")){
            Context context = getApplicationContext();
            CharSequence text = "Name?";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }



        //DISPLAY RESULTS
        TextView pizzaDisplay = findViewById(R.id.pizza);
        pizzaDisplay.setText("Hello " + nameValue+", your pizza is a " + sz + " pizza with " + rw + cheeseS + topping  + crst + suggest);
    }
}
