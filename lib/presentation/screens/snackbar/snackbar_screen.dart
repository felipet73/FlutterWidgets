import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar ( BuildContext context ){
    
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar =  SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: (){}),
      duration: const Duration(seconds: 2),
      );
    
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog (BuildContext context){

    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
      title: const Text('Estas Seguro ?'),
      content: const Text('Sit esse ea laborum velit tempor culpa ullamco in sint laboris sint nulla fugiat dolore.'),
      actions: [
        TextButton(
          onPressed: () => context.pop()
        , child: const Text('Cancelar')),
        FilledButton(onPressed: (){
          context.pop();
        }, child: const Text('Aceptar'))

      ],
    ));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Reprehenderit dolor esse nulla in esse magna Lorem.')
                  ] 
                );
              }, 
              child: const Text('Licencias usadas')),

            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
              child: const Text('Mostrar dialogo'))              
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label:const Text('Mostrar Snackbar'),
        icon: const Icon( Icons.remove_red_eye_outlined),
        onPressed: (){
          showCustomSnackbar(context);
          /*ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Hola Mundo'))
          );*/
        }
        ),
    );
  }
}