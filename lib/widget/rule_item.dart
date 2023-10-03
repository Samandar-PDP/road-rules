import 'package:flutter/material.dart';

class RuleItem extends StatelessWidget {
  const RuleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.car_rental),
        title: Text("Susambil"),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2,color: Colors.indigo)
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit),
                label: Text("Edit"),
                style: TextButton.styleFrom(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2,color: Colors.indigo)
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.delete_forever),
                label: Text("Delete"),
                style: TextButton.styleFrom(),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}
