import 'package:flutter/material.dart';

class RuleItem extends StatelessWidget {
  const RuleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(Icons.car_rental,size: 90,),
          title: Text("Susambil"),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 2,color: Colors.indigo)
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit,size: 15,),
                    label: Text("Edit",style: TextStyle(fontSize: 12),),
                    style: TextButton.styleFrom(),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2,color: Colors.indigo)
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever,size: 15,),
                    label: Text("Delete",style: TextStyle(fontSize: 12),),
                    style: TextButton.styleFrom(),
                  ),
                ),
              ],
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ),
      ),
    );
  }
}
