#include<stdio.h>
#include<stdlib.h>
typedef struct queue
{
    int data;
    struct queue *next;
}node;
node *front=NULL,*rear=NULL;
void enqueue(int x)
{
    node *new;
    new=(node*)malloc(sizeof(node));
    new->data=x;
    new->next=NULL;
    if(front==NULL)
        front=rear=new;
    else
    {
        rear->next=new;
        rear=new;
    }
}
int dequeue()
{
    int x;
    node *temp;
    if(front==NULL)
        return -1;
    else
    {
        x=front->data;
        if(front == rear)
        {
            front=rear=NULL;
        }
        else
        {
            temp=front;
            front=front->next;
            free(temp);
        }
        return x;
    }
}
void display()
{
    node *temp;
    if(front == NULL)
    {
        printf("queue is empty");
    }
    else
    {
        temp=front;
        while(temp!=NULL)
        {
            printf("|%d|->",temp->data);
            temp=temp->next;
        }
        printf("NULL\n");
    }
}
int main()
{
    int x,ch;
    while(1)
    {
        printf("1.push\n2.pop\n3.display\n4.exit\n");
        printf("enter your choice\n");
        scanf("%d",&ch);
        switch(ch)
        {
            case 1: printf("enter the element\n");
                    scanf("%d",&x);
                    enqueue(x);
                    break;
            case 2: x=dequeue();
                    if(x==-1)
                        printf("queue underflow\n");
                    else
                        printf("element deleted is %d\n",x);
                    break;
            case 3: printf("the elements in the stack are\n");
                    display();
                    break;
            case 4: exit(0);
            default: printf("invalid choice");
        }
    }
    return 0;
}
