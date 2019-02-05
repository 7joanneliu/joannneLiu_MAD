package com.example.joanneliu.convert;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
//import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity implements OnItemSelectedListener {
    Spinner forSpun, forOne, forTwo;
    EditText userInput;
    TextView nwAMT;
    int in;
    int OneSelected, TwoSelected;

    public void run(View view) {
        if (forSpun.getSelectedItem().equals("imperial")) {
            bob(OneSelected, TwoSelected);
        } else{
            bob2(OneSelected, TwoSelected);
        }
    }



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //load view spinners
        forSpun = findViewById(R.id.forSpin);
        forOne = findViewById(R.id.forOne);
        forTwo = findViewById(R.id.forTwo);
//        forOneSelected = forOne.getSelectedItemPosition();
//        forTwoSelected = forTwo.getSelectedItemPosition();

        userInput = findViewById(R.id.input);

        //array adaptor based on forSpun
        //takes spinner forSpun choice and picks other spinner options
        ArrayAdapter forAdaptor = ArrayAdapter.createFromResource(this, R.array.forSpinArray, android.R.layout.simple_spinner_item);
        forSpun.setAdapter(forAdaptor);//calls adaptor
        forSpun.setOnItemSelectedListener(this);//sets forSpun to selected choice
    }

    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id){

        //IMPERIAL-----------------------------------------
        if (forSpun.getSelectedItem().equals("metric")){
            ArrayAdapter imperialAdapter = ArrayAdapter.createFromResource(this, R.array.metricArray, android.R.layout.simple_spinner_item);
            forOne.setAdapter(imperialAdapter);//first spinner

            ArrayAdapter imperialAdapter2 = ArrayAdapter.createFromResource(this, R.array.imperialArray, android.R.layout.simple_spinner_item);
            forTwo.setAdapter(imperialAdapter2);//second spinner

            int forOneSelected = forOne.getSelectedItemPosition();
            int forTwoSelected = forTwo.getSelectedItemPosition();
            bob(forOneSelected,forTwoSelected);


        }
        //METRIC-----------------------------------------
        else {
            ArrayAdapter metricAdapter = ArrayAdapter.createFromResource(this, R.array.imperialArray, android.R.layout.simple_spinner_item);
            forOne.setAdapter(metricAdapter);

            ArrayAdapter metricAdapter2 = ArrayAdapter.createFromResource(this, R.array.metricArray, android.R.layout.simple_spinner_item);
            forTwo.setAdapter(metricAdapter2);

            int forOneSelected = forOne.getSelectedItemPosition();
            int forTwoSelected = forTwo.getSelectedItemPosition();
            bob(forOneSelected,forTwoSelected);
        }
    }

    //METRIC------------------------------------------------
    private void bob2(int forOneSelected, int forTwoSelected) {
        forOneSelected = forOne.getSelectedItemPosition();
        forTwoSelected = forTwo.getSelectedItemPosition();
        float calculated;
        float number = Integer.parseInt(userInput.getText().toString());
        nwAMT= findViewById(R.id.newAmount);

        //MILLILITER
        if (forOneSelected == 0 && forTwoSelected ==0){
            calculated= number * 250;//cup - ml
            nwAMT.setText(calculated + " ml");
        }
        else if (forOneSelected == 0 && forTwoSelected ==1){
            calculated= number * 15;// tb - ml
            nwAMT.setText(calculated + " ml");
        }
        else if (forOneSelected == 0 && forTwoSelected ==2){
            calculated= number * 5;// ts - ml
            nwAMT.setText(calculated + " ml");
        }
        else if (forOneSelected == 0 && forTwoSelected ==3){
            calculated= number * 30;// oz - ml
            nwAMT.setText(calculated + " ml");
        }
        else if (forOneSelected == 0 && forTwoSelected ==4){
            calculated= number * 500;// lb - ml
            nwAMT.setText(calculated + " ml");
        }

        //GRAMS
        if (forOneSelected == 1 && forTwoSelected ==0){
            calculated= number * 340;//cup - g
            nwAMT.setText(calculated + " g");
        }
        else if (forOneSelected == 1 && forTwoSelected ==1){
            calculated= number * 14;// tb - g
            nwAMT.setText(calculated + " g");
        }
        else if (forOneSelected == 1 && forTwoSelected ==2){
            calculated= number * 5;// ts - g
            nwAMT.setText(calculated + " g");
        }
        else if (forOneSelected == 1 && forTwoSelected ==3){
            calculated= number * 28;// oz - g
            nwAMT.setText(calculated + " g");
        }
        else if (forOneSelected == 1 && forTwoSelected ==4){
            calculated= number * 454;// lb - g
            nwAMT.setText(calculated + " g");
        }

        //LITERS
        if (forOneSelected == 2 && forTwoSelected ==0){
            calculated= number / 4;//cup - l
            nwAMT.setText(calculated + " L");
        }
        else if (forOneSelected == 2 && forTwoSelected ==1){
            calculated= number / 67;// tb - l
            nwAMT.setText(calculated + " L");
        }
        else if (forOneSelected == 2 && forTwoSelected ==2){
            calculated= number / 203;// ts - l
            nwAMT.setText(calculated + " L");
        }
        else if (forOneSelected == 2 && forTwoSelected ==3){
            calculated= number / 34;// oz - l
            nwAMT.setText(calculated + " L");
        }
        else if (forOneSelected == 2 && forTwoSelected ==4){
            calculated= number * 2 ;// lb - l
            nwAMT.setText(calculated + " L");
        }

        //KILOLITERS
        if (forOneSelected == 3 && forTwoSelected ==0){
            calculated= number / 7;//cup - kg
            nwAMT.setText(calculated + " kg");
        }
        else if (forOneSelected == 3 && forTwoSelected ==1){
            calculated= number / 50;// tb - kg
            nwAMT.setText(calculated + " kg");
        }
        else if (forOneSelected == 3 && forTwoSelected ==2){
            calculated= number / 100;// ts - kg
            nwAMT.setText(calculated + " kg");
        }
        else if (forOneSelected == 3 && forTwoSelected ==3){
            calculated= number / 35;// oz - kg
            nwAMT.setText(calculated + " kg");
        }
        else if (forOneSelected == 3 && forTwoSelected ==4){
            calculated= number / 2 ;// lb - kg
            nwAMT.setText(calculated + " kg");
        }

    }

    //Imperial------------------------------------------------
    private void bob(int forOneSelected, int forTwoSelected) {
        forOneSelected = forOne.getSelectedItemPosition();
        forTwoSelected = forTwo.getSelectedItemPosition();
        float calculated;
        float number = Integer.parseInt(userInput.getText().toString());
        nwAMT= findViewById(R.id.newAmount);

        //CUPS
        if (forOneSelected == 0 && forTwoSelected ==0){
            calculated= number / 237;//cup - ml
            nwAMT.setText(calculated + " cup");
        }
        else if (forOneSelected == 0 && forTwoSelected ==1){
            calculated= number * 128 ;// cup - g
            nwAMT.setText(calculated + " cup");
        }
        else if (forOneSelected == 0 && forTwoSelected ==2){
            calculated= number / 4;// cup - l
            nwAMT.setText(calculated + " cup");
        }
        else if (forOneSelected == 0 && forTwoSelected ==3){
            calculated= number * 4;// cup - kg
            nwAMT.setText(calculated + " cup");
        }

        //TABLESPOON
        if (forOneSelected == 1 && forTwoSelected ==0){
            calculated= number / 14 ;//tbs - ml
            nwAMT.setText(calculated + " tbs");
        }
        else if (forOneSelected == 1 && forTwoSelected ==1){
            calculated= number * 14;// tbs - g
            nwAMT.setText(calculated + " tbs");
        }
        else if (forOneSelected == 1 && forTwoSelected ==2){
            calculated= number * 67;// tbs - l
            nwAMT.setText(calculated + " tbs");
        }
        else if (forOneSelected == 1 && forTwoSelected ==3){
            calculated= number / 50 ;// tbs - kg
            nwAMT.setText(calculated + " tbs");
        }

        //TEASPOON
        if (forOneSelected == 2 && forTwoSelected ==0){
            calculated= number / 5;//tsp - ml
            nwAMT.setText(calculated + " tsp");
        }
        else if (forOneSelected == 2 && forTwoSelected ==1){
            calculated= number / 5;//tsp - g
            nwAMT.setText(calculated + " tsp");
        }
        else if (forOneSelected == 2 && forTwoSelected ==2){
            calculated= number * 203;//tsp - l
            nwAMT.setText(calculated + " tsp");
        }
        else if (forOneSelected == 2 && forTwoSelected ==3){
            calculated= number * 100;//tsp - kg
            nwAMT.setText(calculated + " tsp");
        }

        //OUNCES
        if (forOneSelected == 3 && forTwoSelected ==0){
            calculated= number * 30;//oz - ml
            nwAMT.setText(calculated + " oz");
        }
        else if (forOneSelected == 3 && forTwoSelected ==1){
            calculated= number * 28;// oz - g
            nwAMT.setText(calculated + " oz");
        }
        else if (forOneSelected == 3 && forTwoSelected ==2){
            calculated= number / 34;// oz - l
            nwAMT.setText(calculated + " oz");
        }
        else if (forOneSelected == 3 && forTwoSelected ==3){
            calculated= number / 36;// oz - kg
            nwAMT.setText(calculated + " oz");
        }

        //POUNDS
        if (forOneSelected == 4 && forTwoSelected ==0){
            calculated= number /454 ;//lb - ml
            nwAMT.setText(calculated + " lb");
        }
        else if (forOneSelected == 4 && forTwoSelected ==1){
            calculated= number / 454;// lb - g
            nwAMT.setText(calculated + " lb");
        }
        else if (forOneSelected == 4 && forTwoSelected ==2){
            calculated= number * 9/20 ;// lb - l
            nwAMT.setText(calculated + " lb");
        }
        else if (forOneSelected == 4 && forTwoSelected ==3){
            calculated= number * 2;// lb - kg
            nwAMT.setText(calculated + " lb");
        }

    }



    @Override
    public void onNothingSelected(AdapterView<?> parent) {
        // TODO Auto-generated method stub
    }

//    public void onClick(View view){
//        int forOneSelected = forOne.getSelectedItemPosition();
//        int forTwoSelected = forTwo.getSelectedItemPosition();
//        EditText userInput = (EditText) findViewById(R.id.input);
//        String inputImported = userInput.getText().toString();
////        float userInput = Float.parseFloat(input.getText().toString());
//        switch (forOneSelected){
//            case 0:
//
//                break;
//            case 1:
//                //
//                break;
//        }
//    }


}

/*resources
*https://stackoverflow.com/questions/29474829/how-to-make-spinner-depends-on-another-spinner ---> spinner dependent on another spinner
*/