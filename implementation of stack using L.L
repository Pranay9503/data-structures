#include<stdio.h>
#include<stdlib.h>
typedef struct stack
{
    int data;
    struct stack *next;
}node;
node *top=NULL;
void push(int x)
{
    node *new;
    new=(node*)malloc(sizeof(node));
    new->data=x;
    new->next=NULL;
    if(top==NULL)
        top=new;
    else
    {
        new->next=top;
        top=new;
    }
}
int pop()
{
    int x;
    node *temp;
    if(top==NULL)
        return -1;
    else
    {
        x=top->data;
        temp=top;
        top=top->next;
        free(temp);
        return x;
    }
}
void display()
{
    node *temp;
    temp=top;
    while(temp!=NULL)
    {
        printf("|%d|->",temp->data);
        temp=temp->next;
    }
    printf("NULL\n");
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
                    push(x);
                    break;
            case 2: x=pop();
                    if(x==-1)
                        printf("stack underflow\n");
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
